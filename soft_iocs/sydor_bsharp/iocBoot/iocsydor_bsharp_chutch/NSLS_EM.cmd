<./CONFIG.txt
epicsEnvSet("PORT",      "NSLS_EM")
epicsEnvSet("TEMPLATE",  "NSLS_EM")
epicsEnvSet("QSIZE",     "20")
epicsEnvSet("RING_SIZE", "10000")
epicsEnvSet("TSPOINTS",  "10000")

# Load asynRecord record
dbLoadRecords("$(ASYN)/db/asynRecord.db", "P=$(PREFIX), R=asyn1,PORT=TCP_Command_$(PORT),ADDR=0,OMAX=256,IMAX=256")

drvBS_EMConfigure("$(PORT)", "$(BROADCAST)", $(MODULE_ID), $(RING_SIZE))

#asynSetTraceIOMask("UDP_$(PORT)", 0, 2)
#asynSetTraceMask("UDP_$(PORT)", 0, 9)
#asynSetTraceIOMask("TCP_Cmd_$(PORT)", 0, 2)
asynSetTraceMask("TCP_Command_$(PORT)", 0, 9)
asynSetTraceIOMask("TCP_Data_$(PORT)", 0, 2)
#asynSetTraceMask("TCP_Data_$(PORT)", 0, 9)

dbLoadRecords("$(QUADEM)/db/$(TEMPLATE).template", "P=$(PREFIX), R=$(RECORD), CARD=0, MODULE_ID=$(MODULE_ID), PORT=$(PORT),ADDR=0,TIMEOUT=1")
dbLoadRecords("$(QUADEM)/db/BS_EM_PID.template", "P=$(PREFIX), R=$(RECORD), PORT=$(PORT),ADDR=0,TIMEOUT=1")

< $(QUADEM)/iocBoot/commonPlugins.cmd

asynSetTraceIOMask("$(PORT)",0,2)
#asynSetTraceMask("$(PORT)",  0,0x29)

< $(QUADEM)/iocBoot/saveRestore.cmd

iocInit()

#Set an ID Number
dbpf $(PREFIX)$(RECORD)Card "0"

#Set some values for ease of use

#Scale for nA
dbpf $(PREFIX)$(RECORD)CurrentScale1 1E9
dbpf $(PREFIX)$(RECORD)CurrentScale2 1E9
dbpf $(PREFIX)$(RECORD)CurrentScale3 1E9
dbpf $(PREFIX)$(RECORD)CurrentScale4 1E9

#Scale for plot
#dbpf $(PREFIX)$(RECORD)PositionScaleX 1
#dbpf $(PREFIX)$(RECORD)PositionScaleY 1

#Default Precision of 3
dbpf $(PREFIX)$(RECORD)CurrentPrec1 3
dbpf $(PREFIX)$(RECORD)CurrentPrec2 3
dbpf $(PREFIX)$(RECORD)CurrentPrec3 3
dbpf $(PREFIX)$(RECORD)CurrentPrec4 3
#For some reason current offset precision 2 is not set, so set explicitly
dbpf $(PREFIX)$(RECORD)CurrentOffset2.PREC 3
dbpf $(PREFIX)$(RECORD)PositionOffsetX.PREC 3
dbpf $(PREFIX)$(RECORD)PositionOffsetY.PREC 3 

#Set Geometry to Square
dbpf $(PREFIX)$(RECORD)Geometry 1

#Set Serial NUmber
dbpf $(PREFIX)$(RECORD)B4SerNum $(SERIAL_NUMBER)

#Start historical monitoring
epicsThreadSleep 5
dbpf $(PREFIX)$(RECORD)Acquire 1
epicsThreadSleep 5
dbpf $(PREFIX)$(RECORD)TS:TSAcquire 1

#Set Gain to high (Needs to be set last in the sequence)
dbpf $(PREFIX)$(RECORD)RangeSimple 0

# save settings every thirty seconds
create_monitor_set("auto_settings.req",30,"P=$(PREFIX), R=$(RECORD)")
