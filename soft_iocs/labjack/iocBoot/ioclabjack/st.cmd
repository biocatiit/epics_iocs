#!../../bin/linux-x86_64/labjack
#------------------------------------------------------------------------------
# Define environment variables
< envPaths

epicsEnvSet(PORT, "LJT4:1")
epicsEnvSet(PREFIX, "18ID:LJT4:1:")
epicsEnvSet(PORT2, "LJT4:2")
epicsEnvSet(PREFIX2, "18ID:LJT4:2:")
epicsEnvSet(PORT3, "LJT4:3")
epicsEnvSet(PREFIX3, "18ID:LJT4:3:")
epicsEnvSet WDIG_POINTS 2048
epicsEnvSet WGEN_POINTS 2048

#------------------------------------------------------------------------------
# Register all support components
dbLoadDatabase("../../dbd/labjack.dbd")
labjack_registerRecordDeviceDriver(pdbbase)

#------------------------------------------------------------------------------
# Create driver
#LabJackShowDevices
# If identifying the device by IP name it must be fully qualified, i.e. include periods.
LabJackConfig("$(PORT)", "164.54.204.55", $(WDIG_POINTS), $(WGEN_POINTS))
LabJackConfig("$(PORT2)", "164.54.204.84", $(WDIG_POINTS), $(WGEN_POINTS))
LabJackConfig("$(PORT3)", "164.54.204.83", $(WDIG_POINTS), $(WGEN_POINTS))
#------------------------------------------------------------------------------
###  LabJack support  ###
# If running multiple LabJack devices in the same IOC must set P and PORT differently for each one.
dbLoadTemplate("./LabJack_T4.substitutions", "P=$(PREFIX), PORT=$(PORT), WDIG_POINTS=$(WDIG_POINTS), WGEN_POINTS=$(WGEN_POINTS)")
dbLoadTemplate("./LabJack_T4.substitutions", "P=$(PREFIX2), PORT=$(PORT2), WDIG_POINTS=$(WDIG_POINTS), WGEN_POINTS=$(WGEN_POINTS)")
dbLoadTemplate("./LabJack_T4.substitutions", "P=$(PREFIX3), PORT=$(PORT3), WDIG_POINTS=$(WDIG_POINTS), WGEN_POINTS=$(WGEN_POINTS)")
#------------------------------------------------------------------------------
# Configure auto save/restore
#
iocshLoad("./save_restore.cmd", PREFIX=$(PREFIX))

#------------------------------------------------------------------------------
# Start IOC
iocInit()

#------------------------------------------------------------------------------
# Start autosave

# Monitor every ten seconds
create_monitor_set("auto_settings.req", 10, "P=$(PREFIX), P2=$(PREFIX2), P3=$(PREFIX3)")

date
