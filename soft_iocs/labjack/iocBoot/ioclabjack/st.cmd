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
### Remote shutter sequences ###
< rshtr.cmd
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


# The binary outputs sometimes start with undefined values, so set the appropriate
dbpf 18ID:LJT4:1:Bo0 0
dbpf 18ID:LJT4:1:Bo1 0
dbpf 18ID:LJT4:1:Bo2 0
dbpf 18ID:LJT4:1:Bo3 0
dbpf 18ID:LJT4:1:Bo4 0
dbpf 18ID:LJT4:1:Bo5 0
dbpf 18ID:LJT4:1:Bo6 0
dbpf 18ID:LJT4:1:Bo7 0
dbpf 18ID:LJT4:1:Bo8 0
dbpf 18ID:LJT4:1:Bo9 0
dbpf 18ID:LJT4:1:Bo10 0
dbpf 18ID:LJT4:1:Bo12 0
dbpf 18ID:LJT4:1:Bo12 0
dbpf 18ID:LJT4:1:Bo13 0
dbpf 18ID:LJT4:1:Bo14 0
dbpf 18ID:LJT4:1:Bo15 0
dbpf 18ID:LJT4:1:Bo16 0
dbpf 18ID:LJT4:1:Bo17 0
dbpf 18ID:LJT4:1:Bo18 0

dbpf 18ID:LJT4:2:Bo0 1
dbpf 18ID:LJT4:2:Bo1 1
dbpf 18ID:LJT4:2:Bo2 1
dbpf 18ID:LJT4:2:Bo3 1
dbpf 18ID:LJT4:2:Bo4 1
dbpf 18ID:LJT4:2:Bo5 1
dbpf 18ID:LJT4:2:Bo6 1
dbpf 18ID:LJT4:2:Bo7 1
dbpf 18ID:LJT4:2:Bo8 0
dbpf 18ID:LJT4:2:Bo9 0
dbpf 18ID:LJT4:2:Bo10 0
dbpf 18ID:LJT4:2:Bo12 0
dbpf 18ID:LJT4:2:Bo12 0
dbpf 18ID:LJT4:2:Bo13 0
dbpf 18ID:LJT4:2:Bo14 0
dbpf 18ID:LJT4:2:Bo15 0
dbpf 18ID:LJT4:2:Bo16 0
dbpf 18ID:LJT4:2:Bo17 0
dbpf 18ID:LJT4:2:Bo18 0
