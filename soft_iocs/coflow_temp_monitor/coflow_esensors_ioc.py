import asyncio
import traceback
import time
import json
import xml.etree.ElementTree as ET

from softioc import softioc, builder, asyncio_dispatcher
# import cothread
import requests

class ESensor:
    """ read Esensor data, push to Epics PVs"""
    def __init__(self, label, url, tempc_pv, tempf_pv, humid_pv, timestamp_pv,
        tsensor_name='', hsensor_name=''):
        self.label = label
        self.url = url
        # self.prefix = prefix
        self.format = url.split('.')[-1]

        self.tempf_pv = tempf_pv
        self.tempc_pv = tempc_pv
        self.humid_pv = humid_pv
        self.timestamp_pv = timestamp_pv
        self.session = requests.Session()

        self.tsensor_name = tsensor_name
        self.hsensor_name = hsensor_name

        if self.format == 'xml':
            self.tattr = "tm0"
            self.tunit = "tun0"
            self.hattr = "hu0"
            self.reader = ET.fromstring
        elif self.format == "json":
            self.tattr = "tmp"
            self.hattr = "hum"
            self.tunit = "tun"
            self.reader = json.loads

        resp = self.session.get(self.url, timeout=0.5)
        tdat = self.reader(resp.content.decode("utf-8"))

        if self.format == 'xml':
            ver = tdat.find("ver")
        elif self.format == 'json':
            ver = tdat.get("ver", '')

        if ver.startswith('PR7X'):
            self.model = 'PR7X' # With lux
        elif ver.startswith('PR6X'):
            self.model = 'PR6X'

        if self.model == 'PR6X':
            if self.format == 'xml':
                self.tattr = "tm0"
                self.tunit = "tun0"
                self.hattr = "hu0"
            elif self.format == "json":
                self.tattr = "tmp"
                self.hattr = "hum"
                self.tunit = "tun"

    def getval6x(self, source, attr, force_float=True):
        if self.format == "xml":
            try:
                val = source.find(attr).text
            except:
                val = "-1"
        elif self.format == "json":
            try:
                val = source.get(attr, -1.0)
            except:
                val = "-1"
        if force_float:
            try:
                val = float(val)
            except:
                val = -1.0
        return val

    def getall7x(self, source, force_float=True):
        if self.format == "xml":
            try:
                sdata = source.find('sensors')
                cdata = sdata.find('channels')
                data = sdata.find('info')
                # Needs work
            except:
                val = "-1"

        elif self.format == 'json':
            try:
                sdata = source.get('sensors')
                cdata = sdata['channels']
                for item in cdata:
                    idata = item['info']
                    for sdata in idata:
                        if sdata['name'] == self.tsensor_name:
                            tdata = sdata['data']
                            tunit = sdata['unit']
                        elif sdata['name'] == self.hsensor_name:
                            hdata = sdata['data']

                if force_float:
                    try:
                        tdata = float(tdata)
                    except Exception:
                        tdata = -1.0

                    try:
                        hdata = float(hdata)
                    except Exception:
                        hdata = -1.0
            except Exception:
                # traceback.print_exc()
                pass

        return tdata, tunit, hdata

    def read(self):
        resp = self.session.get(self.url, timeout=0.5)
        tdat = self.reader(resp.content.decode("utf-8"))

        if self.model == 'PR6X':
            tunt = self.getval6x(tdat, self.tunit, force_float=False)
            tval = self.getval6x(tdat, self.tattr)
            hval = self.getval6x(tdat, self.hattr)
        elif self.model == 'PR7X':
            tval, tunt, hval = self.getall7x(tdat)

        return tval, tunt, hval

    def update(self):
        tval, tunit, hval = self.read()
        if tunit in (0, '0', 'F'):
            tval_f = tval
            tval_c = (tval - 32)*5.0/9.0
        else:
            tval_c = tval
            tval_f = (tval_c * 9.0/5) + 32
        tval_f = round(tval_f, 2)
        tval_c = round(tval_c, 2)
        hval   = round(hval, 2)

        self.tempc_pv.set(tval_c)
        self.tempf_pv.set(tval_f)
        self.humid_pv.set(hval)
        self.timestamp_pv.set(time.ctime())

if __name__ == '__main__':
    # Create an asyncio dispatcher, the event loop is now running
    dispatcher = asyncio_dispatcher.AsyncioDispatcher()

    esensors = []

    # Define as prefix, url
    sensor_defs = [
        ['18ID:EnvMon:HPLCInc', "http://164.54.204.195/status.json"],
        ['18ID:EnvMon:CoflowInc', "http://164.54.204.194/status.json"],
        ]

    for sensor_def in sensor_defs:
        prefix = sensor_def[0]
        url = sensor_def[1]

        # Ones with lux sensor
        if len(sensor_def) > 2:
            tname = sensor_def[2]
            hname = sensor_def[3]
        else:
            tname = ''
            hname = ''

        # Set the record prefix
        builder.SetDeviceName(prefix)

        # Create some records
        ai_c = builder.aIn('TempC', initial_value=0.0, DESC='Temperature (C)',
            EGU='C', PREC=1)
        ai_f = builder.aIn('TempF', initial_value=0.0, DESC='Temperature (F)',
            EGU='F', PREC=1)
        ai_h = builder.aIn('Humid', initial_value=0.0, DESC='Humidity (percent)',
            EGU='%', PREC=1)
        si_t = builder.stringIn('TimeStamp', initial_value="",
            DESC='Timestamp of last update')

        esensor = ESensor(prefix, url, ai_c, ai_f, ai_h, si_t, tname, hname)
        esensors.append(esensor)

    # Boilerplate get the IOC started
    builder.LoadDatabase()
    softioc.iocInit(dispatcher)

    tpool = ThreadPoolExecutor()

    # Start processes required to be run after iocInit
    async def update():
        while True:
            try:
                futures =[tpool.submit(e.update()) for e in esensors]
                while not all([f.done() for f in futures]):
                    await asyncio.sleep(0.1)
            except Exception:
                traceback.print_exc()
                pass
            await asyncio.sleep(0.5)

    dispatcher(update)

    # Finally leave the IOC running with an interactive shell.
    softioc.interactive_ioc(globals())
