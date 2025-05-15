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
epicsEnvSet("UNIQUE_ID",     "02246304")

epicsEnvSet("PREFIX2",        "18ID:USB1608G_2:")
epicsEnvSet("PORT2",          "USB1608G_2")
epicsEnvSet("WDIG_POINTS2",   "1048576")
epicsEnvSet("UNIQUE_ID2",     "020A8A7E")

#USB-1608GX-2AO
epicsEnvSet("PREFIX3",        "18ID:USB1608G_2AO_1:")
epicsEnvSet("PORT3",          "USB1608G_3")
epicsEnvSet("WDIG_POINTS3",   "1048576")
epicsEnvSet("WGEN_POINTS3",   "1048576")
epicsEnvSet("UNIQUE_ID3",     "02230EE1")

## Configure port driver
# MultiFunctionConfig((portName,        # The name to give to this asyn port driver
#                      uniqueID,        # For USB the serial number.  For Ethernet the MAC address or IP address.
#                      maxInputPoints,  # Maximum number of input points for waveform digitizer
#                      maxOutputPoints) # Maximum number of output points for waveform generator

# USB-1608G
MultiFunctionConfig("$(PORT)", "$(UNIQUE_ID)", $(WDIG_POINTS), 1)
dbLoadTemplate("$(MEASCOMP)/db/USB1608G.substitutions", "P=$(PREFIX),PORT=$(PORT),WDIG_POINTS=$(WDIG_POINTS)")

MultiFunctionConfig("$(PORT2)", "$(UNIQUE_ID2)", $(WDIG_POINTS2), 1)
dbLoadTemplate("$(MEASCOMP)/db/USB1608G.substitutions", "P=$(PREFIX2),PORT=$(PORT2),WDIG_POINTS=$(WDIG_POINTS2)")

MultiFunctionConfig("$(PORT3)", "$(UNIQUE_ID3)", $(WDIG_POINTS3), $(WGEN_POINTS3))
dbLoadTemplate("$(MEASCOMP)/db/USB1608G_2AO.substitutions", "P=$(PREFIX3),PORT=$(PORT3),WDIG_POINTS=$(WDIG_POINTS3),WGEN_POINTS=$(WGEN_POINTS3)")

< vacuum_subs.cmd
< intensity_subs.cmd

< save_restore.cmd

iocInit

create_monitor_set("auto_settings.req",30,"P1=$(PREFIX),P2=$(PREFIX2),P3=$(PREFIX3)")
create_monitor_set("auto_vac_settings.req",300,)

date
