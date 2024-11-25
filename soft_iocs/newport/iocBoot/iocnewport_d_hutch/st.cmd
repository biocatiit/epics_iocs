#!../../bin/linux-x86_64/newport

#errlogInit(5000)
< envPaths
# Tell EPICS all about the record types, device-support modules, drivers,
# etc. in this build from CARS
dbLoadDatabase("../../dbd/iocnewportLinux.dbd")
iocnewportLinux_registerRecordDeviceDriver(pdbbase)

### Motors
dbLoadTemplate "motor.substitutions.xps"

#dbLoadTemplate "XPSAux.substitutions"

# asyn port, IP address, IP port, number of axes,
# active poll period (ms), idle poll period (ms),
# enable set position, set position settling time (ms)
XPSCreateController("XPS1", "164.54.204.74", 5001, 8, 10, 500, 0, 500)
#asynSetTraceIOMask("XPS1", 0, 2)
#asynSetTraceMask("XPS1", 0, 255)

# asynPort, IP address, IP port, poll period (ms)
#XPSAuxConfig("XPS_AUX1", "164.54.204.74", 5001, 50)
#asynSetTraceIOMask("XPS_AUX1", 0, 2)
#asynSetTraceMask("XPS_AUX1", 0, 255)

# XPS asyn port,  axis, groupName.positionerName, stepSize
#XPSCreateAxis("XPS1",0,"GROUP.PHI",      "1000")
# ILS50PP
XPSCreateAxis("XPS1",2,"Group3.Pos",   "2000")
# ILS50PP
XPSCreateAxis("XPS1",3,"Group4.Pos",   "2000")
# PR50PP
XPSCreateAxis("XPS1",5,"Group6.Pos",   "50")
# ILS50PP
XPSCreateAxis("XPS1",6,"Group7.Pos",   "2000")
# ILS50PP
XPSCreateAxis("XPS1",7,"Group8.Pos",   "2000")

# XPS asyn port,  max points, FTP username, FTP password
# Note: this must be done after configuring axes
XPSCreateProfile("XPS1", 2000, "Administrator", "Administrator")

#Loads PCO records
#dbLoadRecords("$(MOTOR)/db/XPSPositionCompare.db", "P=18ID_Newport_D:,R=m6,PORT=XPS1,ADDR=5,PREC=2")
#dbLoadRecords("$(MOTOR)/db/XPSPositionCompare.db", "P=18ID_Newport_D:,R=m7,PORT=XPS1,ADDR=6,PREC=4")
#dbLoadRecords("$(MOTOR)/db/XPSPositionCompare.db", "P=18ID_Newport_D:,R=m8,PORT=XPS1,ADDR=7,PREC=4")

#Enables defered moves for synchronous group moves
dbLoadRecords("$(TOP)/newportApp/Db/motor_defer.db", "S=18ID_Newport_D,PORT=XPS1,ADDR=0,TIMEOUT=1")

iocInit

# This IOC does not use save/restore, so set values of some PVs
#dbpf("18ID_Newport_D:m1.RTRY", "0")
#dbpf("18ID_Newport_D:m1.TWV", "0.1")
#dbpf("18ID_Newport_D:m2.RTRY", "0")
#dbpf("18ID_Newport_D:m2.TWV", "0.1")
#dbpf("18ID_Newport_D:m3.RTRY", "0")
#dbpf("18ID_Newport_D:m3.TWV", "0.1")
#dbpf("18ID_Newport_D:m4.RTRY", "0")
#dbpf("18ID_Newport_D:m4.TWV", "0.1")
#dbpf("18ID_Newport_D:m5.RTRY", "0")
#dbpf("18ID_Newport_D:m5.TWV", "0.1")
dbpf("18ID_Newport_D:m6.RTRY", "0")
dbpf("18ID_Newport_D:m6.TWV", "0.1")
dbpf("18ID_Newport_D:m7.RTRY", "0")
dbpf("18ID_Newport_D:m7.TWV", "0.1")
dbpf("18ID_Newport_D:m8.RTRY", "0")
dbpf("18ID_Newport_D:m8.TWV", "0.1")
