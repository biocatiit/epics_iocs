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

# Load dark counters
dbLoadTemplate("./dark.substitutions","N1=$(MAX_POINTS),N2=$(MAX_POINTS2)")

### Scan-support software
# crate-resident scan.  This executes 1D, 2D, 3D, and 4D scans, and caches
# 1D data, but it doesn't store anything to disk.  (See 'saveData' below for that.)
dbLoadRecords("$(SSCAN)/sscanApp/Db/standardScans.db","P=18ID:Scans:,MAXPTS1=8000,MAXPTS2=1000,MAXPTS3=10,MAXPTS4=10,MAXPTSH=8000")
dbLoadRecords("$(SSCAN)/sscanApp/Db/saveData.db","P=18ID:Scans:")

< save_restore.cmd

iocInit

seq(USBCTR_SNL, "P=$(MCS_PREFIX), R=$(RNAME), NUM_COUNTERS=$(MAX_COUNTERS), FIELD=$(FIELD)")
seq(USBCTR_SNL, "P=$(MCS_PREFIX2), R=$(RNAME2), NUM_COUNTERS=$(MAX_COUNTERS2), FIELD=$(FIELD2)")

# Initialize saveData for step scans
saveData_Init("saveData.req", "P=18ID:Scans:")

create_monitor_set("auto_settings.req",30,"P1=$(PREFIX),MP1=$(MCS_PREFIX),P2=$(PREFIX2),MP2=$(MCS_PREFIX2),SP=18ID:Scans:")

# Set up scaler counters for dark counts
# Put dark count vals in INPJ, put calculated count time (assumed as calc1, in input k for everything except calc1)
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc1.INPJ", "$(PREFIX)Dark1.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc2.INPJ", "$(PREFIX)Dark2.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc2.INPK", "$(SCALER_PREFIX)$(SCALER_NAME)_calc1.VAL NPP NMS")
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc3.INPJ", "$(PREFIX)Dark3.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc3.INPK", "$(SCALER_PREFIX)$(SCALER_NAME)_calc1.VAL NPP NMS")
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc4.INPJ", "$(PREFIX)Dark4.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc4.INPK", "$(SCALER_PREFIX)$(SCALER_NAME)_calc1.VAL NPP NMS")
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc5.INPJ", "$(PREFIX)Dark5.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc5.INPK", "$(SCALER_PREFIX)$(SCALER_NAME)_calc1.VAL NPP NMS")
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc6.INPJ", "$(PREFIX)Dark6.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc6.INPK", "$(SCALER_PREFIX)$(SCALER_NAME)_calc1.VAL NPP NMS")
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc7.INPJ", "$(PREFIX)Dark7.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc7.INPK", "$(SCALER_PREFIX)$(SCALER_NAME)_calc1.VAL NPP NMS")
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc8.INPJ", "$(PREFIX)Dark8.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX)$(SCALER_NAME)_calc8.INPK", "$(SCALER_PREFIX)$(SCALER_NAME)_calc1.VAL NPP NMS")

dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc1.INPJ", "$(PREFIX2)Dark1.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc2.INPJ", "$(PREFIX2)Dark2.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc2.INPK", "$(SCALER_PREFIX2)$(SCALER_NAME2)_calc1.VAL NPP NMS")
dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc3.INPJ", "$(PREFIX2)Dark3.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc3.INPK", "$(SCALER_PREFIX2)$(SCALER_NAME2)_calc1.VAL NPP NMS")
dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc4.INPJ", "$(PREFIX2)Dark4.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc4.INPK", "$(SCALER_PREFIX2)$(SCALER_NAME2)_calc1.VAL NPP NMS")
dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc5.INPJ", "$(PREFIX2)Dark5.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc5.INPK", "$(SCALER_PREFIX2)$(SCALER_NAME2)_calc1.VAL NPP NMS")
dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc6.INPJ", "$(PREFIX2)Dark6.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc6.INPK", "$(SCALER_PREFIX2)$(SCALER_NAME2)_calc1.VAL NPP NMS")
dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc7.INPJ", "$(PREFIX2)Dark7.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc7.INPK", "$(SCALER_PREFIX2)$(SCALER_NAME2)_calc1.VAL NPP NMS")
dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc8.INPJ", "$(PREFIX2)Dark8.OVAL NPP NMS")
dbpf("$(SCALER_PREFIX2)$(SCALER_NAME2)_calc8.INPK", "$(SCALER_PREFIX2)$(SCALER_NAME2)_calc1.VAL NPP NMS")

#Set up dark correction for mcs, by fixing flinks
dbpf("$(MCS_PREFIX)DarkSub:mca8.FLNK", "")
dbpf("$(MCS_PREFIX2)DarkSub:mca8.FLNK", "")

dbpf("$(MCS_PREFIX)mca1.FLNK", "$(MCS_PREFIX)TimeCalc:mca1.PROC PP")
dbpf("$(MCS_PREFIX2)mca1.FLNK", "$(MCS_PREFIX)TimeCalc:mca1.PROC PP")

date
