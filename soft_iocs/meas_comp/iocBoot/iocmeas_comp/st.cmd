#!../../bin/linux-x86_64/meas_comp
#------------------------------------------------------------------------------
# Define environment variables
< envPaths

## Register all support components
dbLoadDatabase "../../dbd/meas_comp.dbd"
meas_comp_registerRecordDeviceDriver pdbbase

# USB-1608G
epicsEnvSet("PREFIX",        "18ID:USB1608G_1:")
epicsEnvSet("PORT",          "USB1608G_1")
epicsEnvSet("WDIG_POINTS",   "1048576")
epicsEnvSet("UNIQUE_ID",     "020A8A7E")


## Configure port driver
# MultiFunctionConfig((portName,        # The name to give to this asyn port driver
#                      uniqueID,        # For USB the serial number.  For Ethernet the MAC address or IP address.
#                      maxInputPoints,  # Maximum number of input points for waveform digitizer
#                      maxOutputPoints) # Maximum number of output points for waveform generator

# USB-1608G
MultiFunctionConfig("$(PORT)", "$(UNIQUE_ID)", $(WDIG_POINTS), 1)
dbLoadTemplate("$(MEASCOMP)/db/USB1608G.substitutions", "P=$(PREFIX),PORT=$(PORT),WDIG_POINTS=$(WDIG_POINTS)")

< save_restore.cmd

iocInit

create_monitor_set("auto_settings.req",30,"P=$(PREFIX)")

date
