
# BEGIN ip330.cmd -------------------------------------------------------------

# Initialize Acromag IP-330 ADC
# initIp330(
#   const char *portName, int carrier, int slot,
#   const char *typeString, const char *rangeString,
#   int firstChan, int lastChan,
#   int intVec)
# portName    = name to give this asyn port
# carrier     = IPAC carrier number (0, 1, etc.)
# slot        = IPAC slot (0,1,2,3, etc.)
# typeString  = "D" or "S" for differential or single-ended
# rangeString = "-5to5","-10to10","0to5", or "0to10"
#               This value must match hardware setting selected
# firstChan   = first channel to be digitized.  This must be in the range:
#               0 to 31 (single-ended)
#               0 to 15 (differential)
# lastChan    = last channel to be digitized
# maxClients  = Maximum number of IP330 tasks which will attach to this
#                Ip330 module. For example Ip330Scan, Ip330Sweep, etc. This
#                does not refer to the number of EPICS clients. A value of 
#                10 should certain be safe.
initIp330("Ip330_1",0,3,"D","-10to10",0,15,120) 
#Old configuration which may be working? Having trouble understanding documentation

# int configIp330(
#   const char *portName,
#   int scanMode, const char *triggerString,
#   int microSecondsPerScan, int secondsBetweenCalibrate)
# portName    = name of aysn port created with initIp330
# scanMode    = scan mode:
#               0 = disable
#               1 = uniformContinuous
#               2 = uniformSingle
#               3 = burstContinuous (normally recommended)
#               4 = burstSingle
#               5 = convertOnExternalTriggerOnly
# triggerString = "Input" or "Output". Selects the direction of the external
#               trigger signal.
# microSecondsPerScan = repeat interval to digitize all channels
#               The minimum theoretical time is 15 microseconds times the
#               number of channels, but a practical limit is probably 100
#               microseconds.
# secondsBetweenCalibrate = number of seconds between calibration cycles.
#               If zero then there will be no periodic calibration, but
#               one calibration will still be done at initialization.
configIp330("Ip330_1", 3,"Input",500,0)

# int initFastSweep(char *portName, char *inputName,
#                   int maxSignals, int maxPoints)
# portName   = asyn port name for this port
# inputName  = name of input port
# maxSignals = maximum number of input signals.
# maxPoints  = maximum number of points in a sweep.  The amount of memory
#              allocated will be maxPoints*maxSignals*4 bytes
initFastSweep("Ip330Sweep1","Ip330_1", 4, 2048)

# ai records using asynInt32Average device support
dbLoadTemplate "ip330Scan.substitutions"

# epid record using fast feedback with dac128V
# dbLoadTemplate "ip330PIDFast.substitutions"

# Load MCA records on the first 4 input channels
dbLoadRecords("$(MCA)/mcaApp/Db/mca.db", "P=18ID:,M=mip330_01,DTYP=asynMCA,NCHAN=2048,INP=@asyn(Ip330Sweep1 0)")
dbLoadRecords("$(MCA)/mcaApp/Db/mca.db", "P=18ID:,M=mip330_02,DTYP=asynMCA,NCHAN=2048,INP=@asyn(Ip330Sweep1 1)")
dbLoadRecords("$(MCA)/mcaApp/Db/mca.db", "P=18ID:,M=mip330_03,DTYP=asynMCA,NCHAN=2048,INP=@asyn(Ip330Sweep1 2)")
dbLoadRecords("$(MCA)/mcaApp/Db/mca.db", "P=18ID:,M=mip330_04,DTYP=asynMCA,NCHAN=2048,INP=@asyn(Ip330Sweep1 3)")

# END ip330.cmd ---------------------------------------------------------------
