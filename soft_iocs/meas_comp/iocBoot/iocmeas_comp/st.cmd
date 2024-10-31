#!../../bin/linux-x86_64/meas_comp
#------------------------------------------------------------------------------
# Define environment variables
< envPaths

## Register all support components
dbLoadDatabase "../../dbd/meas_comp.dbd"
meas_comp_registerRecordDeviceDriver pdbbase

# E-TC
epicsEnvSet("PREFIX",        "18ID:ETC:")
epicsEnvSet("PORT",          "ETC_1")
epicsEnvSet("UNIQUE_ID",     "164.54.204.159")

# E-1608
epicsEnvSet("PREFIX2",        "18ID:E1608:")
epicsEnvSet("PORT2",          "E1608_1")
epicsEnvSet("WDIG_POINTS",   "2048")
epicsEnvSet("UNIQUE_ID2",     "164.54.204.158")

# USB-1608G
epicsEnvSet("PREFIX3",        "18ID:USB1608G_1:")
epicsEnvSet("PORT3",          "USB1608G_1")
epicsEnvSet("WDIG_POINTS3",   "1048576")
epicsEnvSet("UNIQUE_ID3",     "020A8A7E")


# E-TC
## Configure port driver
# MultiFunctionConfig((portName,        # The name to give to this asyn port driver
#                      uniqueID,        # For USB the serial number.  For Ethernet the MAC address or IP address.
#                      maxInputPoints,  # Maximum number of input points for waveform digitizer
#                      maxOutputPoints) # Maximum number of output points for waveform generator
MultiFunctionConfig("$(PORT)", "$(UNIQUE_ID)", 1, 1)

#asynSetTraceMask($(PORT), -1, ERROR|FLOW|DRIVER)

dbLoadTemplate("$(MEASCOMP)/db/ETC.substitutions", "P=$(PREFIX),PORT=$(PORT)")


# E-1608
MultiFunctionConfig("$(PORT2)", "$(UNIQUE_ID2)", $(WDIG_POINTS), 1)
dbLoadTemplate("$(MEASCOMP)/db/E1608.substitutions", "P=$(PREFIX2),PORT=$(PORT2),WDIG_POINTS=$(WDIG_POINTS)")


# USB-1608G
MultiFunctionConfig("$(PORT3)", "$(UNIQUE_ID3)", $(WDIG_POINTS), 1)
dbLoadTemplate("$(MEASCOMP)/db/USB1608G.substitutions", "P=$(PREFIX3),PORT=$(PORT3),WDIG_POINTS=$(WDIG_POINTS3)")

< save_restore.cmd

iocInit

create_monitor_set("auto_settings.req",30,"P=$(PREFIX)")

date
