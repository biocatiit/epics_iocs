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
XPSCreateController("XPS1", "164.54.204.76", 5001, 8, 10, 500, 0, 500)
#asynSetTraceIOMask("XPS1", 0, 2)
#asynSetTraceMask("XPS1", 0, 255)

# asynPort, IP address, IP port, poll period (ms)
#XPSAuxConfig("XPS_AUX1", "164.54.204.76", 5001, 50)
#asynSetTraceIOMask("XPS_AUX1", 0, 2)
#asynSetTraceMask("XPS_AUX1", 0, 255)

# XPS asyn port,  axis, groupName.positionerName, stepSize
# XMS160-S
XPSCreateAxis("XPS1",4,"XY.X",   "1000000")
# ILS50PP
XPSCreateAxis("XPS1",5,"XY.Y",   "10000")

# XPS asyn port,  max points, FTP username, FTP password
# Note: this must be done after configuring axes
XPSCreateProfile("XPS1", 2000, "Administrator", "Administrator")

#Loads PCO records
dbLoadRecords("$(MOTOR)/db/XPSPositionCompare.db", "P=18ID_Newport_TR:,R=m5,PORT=XPS1,ADDR=4,PREC=6")
dbLoadRecords("$(MOTOR)/db/XPSPositionCompare.db", "P=18ID_Newport_TR:,R=m6,PORT=XPS1,ADDR=5,PREC=5")

#Enables defered moves for synchronous group moves
dbLoadRecords("$(TOP)/newportApp/Db/motor_defer.db", "S=18ID_Newport_TR,PORT=XPS1,ADDR=0,TIMEOUT=1")

iocInit

# This IOC does not use save/restore, so set values of some PVs
#dbpf("18ID_Newport_TR:m1.RTRY", "0")
#dbpf("18ID_Newport_TR:m1.TWV", "0.1")
#dbpf("18ID_Newport_TR:m2.RTRY", "0")
#dbpf("18ID_Newport_TR:m2.TWV", "0.1")
#dbpf("18ID_Newport_TR:m3.RTRY", "0")
#dbpf("18ID_Newport_TR:m3.TWV", "0.1")
#dbpf("18ID_Newport_TR:m4.RTRY", "0")
#dbpf("18ID_Newport_TR:m4.TWV", "0.1")
dbpf("18ID_Newport_TR:m5.RTRY", "0")
dbpf("18ID_Newport_TR:m5.TWV", "0.1")
dbpf("18ID_Newport_TR:m6.RTRY", "0")
dbpf("18ID_Newport_TR:m6.TWV", "0.1")
#dbpf("18ID_Newport_TR:m7.RTRY", "0")
#dbpf("18ID_Newport_TR:m7.TWV", "0.1")
#dbpf("18ID_Newport_TR:m8.RTRY", "0")
#dbpf("18ID_Newport_TR:m8.TWV", "0.1")
