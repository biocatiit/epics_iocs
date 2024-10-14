#!../../bin/linux-x86_64/meas_comp
#------------------------------------------------------------------------------
# Define environment variables
< envPaths

## Register all support components
dbLoadDatabase "../../dbd/meas_comp.dbd"
meas_comp_registerRecordDeviceDriver pdbbase

epicsEnvSet("PREFIX",        "18ID:ETC:")
epicsEnvSet("PORT",          "ETC_1")
epicsEnvSet("UNIQUE_ID",     "164.54.204.159")

## Configure port driver
# MultiFunctionConfig((portName,        # The name to give to this asyn port driver
#                      uniqueID,        # For USB the serial number.  For Ethernet the MAC address or IP address.
#                      maxInputPoints,  # Maximum number of input points for waveform digitizer
#                      maxOutputPoints) # Maximum number of output points for waveform generator
MultiFunctionConfig("$(PORT)", "$(UNIQUE_ID)", 1, 1)

#asynSetTraceMask($(PORT), -1, ERROR|FLOW|DRIVER)

dbLoadTemplate("$(MEASCOMP)/db/ETC.substitutions", "P=$(PREFIX),PORT=$(PORT)")

< save_restore.cmd

iocInit

create_monitor_set("auto_settings.req",30,"P=$(PREFIX)")

date
