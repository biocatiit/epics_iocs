#!../../bin/linux-x86_64/meas_comp
#------------------------------------------------------------------------------
# Define environment variables
< envPaths

## Register all support components
dbLoadDatabase "../../dbd/meas_comp.dbd"
meas_comp_registerRecordDeviceDriver pdbbase

epicsEnvSet("PREFIX",             "18ID:USBCTR08:1:")
epicsEnvSet("PORT",               "USBCTR_1")
epicsEnvSet("UNIQUE_ID",          "0213F516")
epicsEnvSet("MCS_PREFIX",         "$(PREFIX)MCS:")
epicsEnvSet("SCALER_PREFIX",      "$(PREFIX)"
epicsEnvSet("SCALER_NAME",        "scaler1")
epicsEnvSet("RNAME",              "mca")
epicsEnvSet("MAX_COUNTERS",       "9")
epicsEnvSet("MAX_POINTS",         "15000")
# For MCA records FIELD=READ, for waveform records FIELD=PROC
epicsEnvSet("FIELD",              "PROC")

epicsEnvSet("PREFIX2",             "18ID:USBCTR08:2:")
epicsEnvSet("PORT2",               "USBCTR_2")
epicsEnvSet("UNIQUE_ID2",          "0213F5C1")
epicsEnvSet("MCS_PREFIX2",         "$(PREFIX2)MCS:")
epicsEnvSet("SCALER_PREFIX2",      "$(PREFIX2)"
epicsEnvSet("SCALER_NAME2",        "scaler1")
epicsEnvSet("RNAME2",              "mca")
epicsEnvSet("MAX_COUNTERS2",       "9")
epicsEnvSet("MAX_POINTS2",         "4000")
# For MCA records FIELD=READ, for waveform records FIELD=PROC
epicsEnvSet("FIELD2",              "PROC")

## Set the minimum sleep time to 1 ms - Windows only
#asynSetMinTimerPeriod(0.001)

# CTR08 1
## Configure port driver
# USBCTRConfig(portName,       # The name to give to this asyn port driver
#              uniqueID,       # Device serial number.
#              maxTimePoints)  # Maximum number of time points for MCS
USBCTRConfig("$(PORT)", "$(UNIQUE_ID)", $(MAX_POINTS))

#asynSetTraceMask($(PORT), -1, ERROR|FLOW|DRIVER)

dbLoadTemplate("$(MEASCOMP)/db/USBCTR.substitutions", "P=$(PREFIX), PORT=$(PORT)")

# This loads the scaler record and supporting records
dbLoadRecords("$(SCALER)/db/scaler.db", "P=$(SCALER_PREFIX), S=$(SCALER_NAME), DTYP=Asyn Scaler, OUT=@asyn($(PORT)), FREQ=10000000")

# This database provides the support for the MCS functions
dbLoadRecords("$(MEASCOMP)/db/measCompMCS.template", "P=$(MCS_PREFIX), PORT=$(PORT), MAX_POINTS=$(MAX_POINTS)")

# Load either MCA or waveform records below
# The number of records loaded must be the same as MAX_COUNTERS defined above

# Load the MCA records
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX), M=$(RNAME)1,  DTYP=asynMCA, INP=@asyn($(PORT) 0),  PREC=3, CHANS=$(MAX_POINTS)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX), M=$(RNAME)2,  DTYP=asynMCA, INP=@asyn($(PORT) 1),  PREC=3, CHANS=$(MAX_POINTS)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX), M=$(RNAME)3,  DTYP=asynMCA, INP=@asyn($(PORT) 2),  PREC=3, CHANS=$(MAX_POINTS)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX), M=$(RNAME)4,  DTYP=asynMCA, INP=@asyn($(PORT) 3),  PREC=3, CHANS=$(MAX_POINTS)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX), M=$(RNAME)5,  DTYP=asynMCA, INP=@asyn($(PORT) 4),  PREC=3, CHANS=$(MAX_POINTS)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX), M=$(RNAME)6,  DTYP=asynMCA, INP=@asyn($(PORT) 5),  PREC=3, CHANS=$(MAX_POINTS)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX), M=$(RNAME)7,  DTYP=asynMCA, INP=@asyn($(PORT) 6),  PREC=3, CHANS=$(MAX_POINTS)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX), M=$(RNAME)8,  DTYP=asynMCA, INP=@asyn($(PORT) 7),  PREC=3, CHANS=$(MAX_POINTS)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX), M=$(RNAME)9,  DTYP=asynMCA, INP=@asyn($(PORT) 8),  PREC=3, CHANS=$(MAX_POINTS)")

# This loads the waveform records
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX), R=$(RNAME)1,  INP=@asyn($(PORT) 0),  CHANS=$(MAX_POINTS)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX), R=$(RNAME)2,  INP=@asyn($(PORT) 1),  CHANS=$(MAX_POINTS)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX), R=$(RNAME)3,  INP=@asyn($(PORT) 2),  CHANS=$(MAX_POINTS)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX), R=$(RNAME)4,  INP=@asyn($(PORT) 3),  CHANS=$(MAX_POINTS)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX), R=$(RNAME)5,  INP=@asyn($(PORT) 4),  CHANS=$(MAX_POINTS)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX), R=$(RNAME)6,  INP=@asyn($(PORT) 5),  CHANS=$(MAX_POINTS)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX), R=$(RNAME)7,  INP=@asyn($(PORT) 6),  CHANS=$(MAX_POINTS)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX), R=$(RNAME)8,  INP=@asyn($(PORT) 7),  CHANS=$(MAX_POINTS)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX), R=$(RNAME)9,  INP=@asyn($(PORT) 8),  CHANS=$(MAX_POINTS)")


# CTR08 2
## Configure port driver
# USBCTRConfig(portName,       # The name to give to this asyn port driver
#              uniqueID,       # Device serial number.
#              maxTimePoints)  # Maximum number of time points for MCS
USBCTRConfig("$(PORT2)", "$(UNIQUE_ID2)", $(MAX_POINTS2))

#asynSetTraceMask($(PORT2), -1, ERROR|FLOW|DRIVER)

dbLoadTemplate("$(MEASCOMP)/db/USBCTR.substitutions", "P=$(PREFIX2), PORT=$(PORT2)")

# This loads the scaler record and supporting records
dbLoadRecords("$(SCALER)/db/scaler.db", "P=$(SCALER_PREFIX2), S=$(SCALER_NAME2), DTYP=Asyn Scaler, OUT=@asyn($(PORT2)), FREQ=10000000")

# This database provides the support for the MCS functions
dbLoadRecords("$(MEASCOMP)/db/measCompMCS.template", "P=$(MCS_PREFIX2), PORT=$(PORT2), MAX_POINTS=$(MAX_POINTS2)")

# Load either MCA or waveform records below
# The number of records loaded must be the same as MAX_COUNTERS defined above

# Load the MCA records
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX2), M=$(RNAME2)1,  DTYP=asynMCA, INP=@asyn($(PORT2) 0),  PREC=3, CHANS=$(MAX_POINTS2)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX2), M=$(RNAME2)2,  DTYP=asynMCA, INP=@asyn($(PORT2) 1),  PREC=3, CHANS=$(MAX_POINTS2)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX2), M=$(RNAME2)3,  DTYP=asynMCA, INP=@asyn($(PORT2) 2),  PREC=3, CHANS=$(MAX_POINTS2)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX2), M=$(RNAME2)4,  DTYP=asynMCA, INP=@asyn($(PORT2) 3),  PREC=3, CHANS=$(MAX_POINTS2)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX2), M=$(RNAME2)5,  DTYP=asynMCA, INP=@asyn($(PORT2) 4),  PREC=3, CHANS=$(MAX_POINTS2)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX2), M=$(RNAME2)6,  DTYP=asynMCA, INP=@asyn($(PORT2) 5),  PREC=3, CHANS=$(MAX_POINTS2)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX2), M=$(RNAME2)7,  DTYP=asynMCA, INP=@asyn($(PORT2) 6),  PREC=3, CHANS=$(MAX_POINTS2)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX2), M=$(RNAME2)8,  DTYP=asynMCA, INP=@asyn($(PORT2) 7),  PREC=3, CHANS=$(MAX_POINTS2)")
#dbLoadRecords("$(MCA)/mcaApp/Db/simple_mca.db", "P=$(MCS_PREFIX2), M=$(RNAME2)9,  DTYP=asynMCA, INP=@asyn($(PORT2) 8),  PREC=3, CHANS=$(MAX_POINTS2)")

# This loads the waveform records
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX2), R=$(RNAME2)1,  INP=@asyn($(PORT2) 0),  CHANS=$(MAX_POINTS2)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX2), R=$(RNAME2)2,  INP=@asyn($(PORT2) 1),  CHANS=$(MAX_POINTS2)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX2), R=$(RNAME2)3,  INP=@asyn($(PORT2) 2),  CHANS=$(MAX_POINTS2)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX2), R=$(RNAME2)4,  INP=@asyn($(PORT2) 3),  CHANS=$(MAX_POINTS2)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX2), R=$(RNAME2)5,  INP=@asyn($(PORT2) 4),  CHANS=$(MAX_POINTS2)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX2), R=$(RNAME2)6,  INP=@asyn($(PORT2) 5),  CHANS=$(MAX_POINTS2)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX2), R=$(RNAME2)7,  INP=@asyn($(PORT2) 6),  CHANS=$(MAX_POINTS2)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX2), R=$(RNAME2)8,  INP=@asyn($(PORT2) 7),  CHANS=$(MAX_POINTS2)")
dbLoadRecords("$(MCA)/mcaApp/Db/SIS38XX_waveform.template", "P=$(MCS_PREFIX2), R=$(RNAME2)9,  INP=@asyn($(PORT2) 8),  CHANS=$(MAX_POINTS2)")


< save_restore.cmd

iocInit

seq(USBCTR_SNL, "P=$(MCS_PREFIX), R=$(RNAME), NUM_COUNTERS=$(MAX_COUNTERS), FIELD=$(FIELD)")
seq(USBCTR_SNL, "P=$(MCS_PREFIX2), R=$(RNAME2), NUM_COUNTERS=$(MAX_COUNTERS2), FIELD=$(FIELD2)")

create_monitor_set("auto_settings.req",30,"P1=$(PREFIX),MP1=$(MCS_PREFIX),P2=$(PREFIX2),MP2=$(MCS_PREFIX2)")

date
