import asyncio
import traceback
import time

from softioc import softioc, builder, asyncio_dispatcher
# import cothread
import requests

class MemmertIncubator:
    """ read/writes Memmert Incubator data, push to Epics PVs"""
    def __init__(self, label, url):
        self.label = label
        self.url = url
        self.status_url = '{}Temp1Read=&TempSet='.format(self.url)
        self.set_url = '{}TempSet='.format(self.url)

        self.session = requests.Session()

        cur_temp, setpoint, set_range, min_setpoint, max_setpoint = self.read()

        builder.SetDeviceName(label)

        # Create some records
        self.temp_pv = builder.aIn('Temp', initial_value=cur_temp,
            DESC='Temperature (C)', EGU='C', PREC=3)
        self.setpoint_pv = builder.aOut('TempSetpoint', initial_value=setpoint,
            DESC='Temperature Setpoint (C)', EGU='C', PREC=1, DRVL=min_setpoint,
            DRVH=max_setpoint, on_update=self.set_temperature)
        self.timestamp_pv = builder.stringIn('TimeStamp', initial_value="",
            DESC='Timestamp of last update')

    def read(self):
        resp = self.session.get(self.status_url, timeout=0.5)
        tdat = resp.text

        cur_temp = float(tdat.split(',')[0].split(':')[1])
        setpoint = float(tdat.split(',')[1].split(':')[1])
        set_range = ','.join(tdat.split(',')[2:])
        min_setpoint = float(set_range.split(':')[2].split(',')[0])
        max_setpoint = float(set_range.split(':')[3].split('}')[0])

        return cur_temp, setpoint, set_range, min_setpoint, max_setpoint

    def update(self):
        cur_temp, setpoint, set_range, min_setpoint, max_setpoint = self.read()

        self.temp_pv.set(cur_temp)
        self.setpoint_pv.set(setpoint)
        self.timestamp_pv.set(time.ctime())

    def set_temperature(self, value):
        value = round(float(value), 1)
        self.session.get('{}{}'.format(self.status_url,value), timeout=0.5)

if __name__ == '__main__':
    # Create an asyncio dispatcher, the event loop is now running
    dispatcher = asyncio_dispatcher.AsyncioDispatcher()

    incubators = []

    # Define as prefix, url
    sensor_defs = [
        ['18ID:Memmert:HPLCInc', "http://164.54.204.116/atmoweb?"],
        ['18ID:Memmert:CoflowInc', "http://164.54.204.117/atmoweb?"],
        ]

    for sensor_def in sensor_defs:
        prefix = sensor_def[0]
        url = sensor_def[1]
        # Set the record prefix


        incubator = MemmertIncubator(prefix, url)
        incubators.append(incubator)

    # Boilerplate get the IOC started
    builder.LoadDatabase()
    softioc.iocInit(dispatcher)

    # Start processes required to be run after iocInit
    async def update():
        while True:
            try:
                [inc.update() for inc in incubators]
            except Exception:
                # traceback.print_exc()
                pass
            await asyncio.sleep(0.5)

    dispatcher(update)

    # Finally leave the IOC running with an interactive shell.
    softioc.interactive_ioc(globals())
