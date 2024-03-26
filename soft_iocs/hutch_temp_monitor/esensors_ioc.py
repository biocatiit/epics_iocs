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
    def __init__(self, label, url, tempc_pv, tempf_pv, humid_pv, timestamp_pv):
        self.label = label
        self.url = url
        # self.prefix = prefix
        self.format = url.split('.')[-1]

        self.tempf_pv = tempf_pv
        self.tempc_pv = tempc_pv
        self.humid_pv = humid_pv
        self.timestamp_pv = timestamp_pv

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

    def getval(self, source, attr, force_float=True):
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

    def read(self):
        resp = requests.get(self.url, timeout=0.5)
        tdat = self.reader(resp.content.decode("utf-8"))

        tunt = self.getval(tdat, self.tunit, force_float=False)
        tval = self.getval(tdat, self.tattr)
        hval = self.getval(tdat, self.hattr)
        return tval, tunt, hval

    def update(self):
        tval, tunit, hval = self.read()
        if tunit in (0, '0', 'F'):
            tval_f = tval
            tval_c = (tval - 32)*5.0/9.0
        else:
            tval_c = tval
            tval_f = (tval_c * 9.0/5) + 32
        tval_f = float("%.3f" % tval_f)
        tval_c = float("%.3f" % tval_c)
        hval   = float("%.3f" % hval)

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
        ['18ID:EnvMon:D', "http://164.54.204.197/status.json"],
        ['18ID:EnvMon:C', "http://164.54.204.198/status.json"],
        ['18ID:EnvMon:A', "http://164.54.204.199/status.json"],
        ]

    for sensor_def in sensor_defs:
        prefix = sensor_def[0]
        url = sensor_def[1]
        # Set the record prefix
        builder.SetDeviceName(prefix)

        # Create some records
        ai_c = builder.aIn('TempC', initial_value=0, DESC='Temperature (C)')
        ai_f = builder.aIn('TempF', initial_value=0, DESC='Temperature (F)')
        ai_h = builder.aIn('Humid', initial_value=0, DESC='Humidity (percent)')
        si_t = builder.stringIn('TimeStamp', initial_value="", DESC='Timestamp of last update')

        esensor = ESensor(prefix, url, ai_c, ai_f, ai_h, si_t)
        esensors.append(esensor)

    # Boilerplate get the IOC started
    builder.LoadDatabase()
    softioc.iocInit(dispatcher)

    # Start processes required to be run after iocInit
    async def update():
        while True:
            try:
                [e.update() for e in esensors]
            except Exception:
                # traceback.print_exc()
                pass
            await asyncio.sleep(0.5)

    dispatcher(update)

    # Finally leave the IOC running with an interactive shell.
    softioc.interactive_ioc(globals())
