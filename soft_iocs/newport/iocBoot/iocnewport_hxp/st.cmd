#!../../bin/linux-x86_64/newport

#errlogInit(5000)
< envPaths
# Tell EPICS all about the record types, device-support modules, drivers,
# etc. in this build from CARS
dbLoadDatabase("../../dbd/iocnewportLinux.dbd")
iocnewportLinux_registerRecordDeviceDriver(pdbbase)

### Motors
dbLoadTemplate("motor.substitutions.hxp")

HXPCreateController("HXP1", "164.54.204.49", 5001, 200, 1000)
# A shorter, idle-poll period is desirable if the motors
# are moved using HXP_moveAll.adl, since this period determines
# how long it takes for the motor records to see that an
# external move has been initiated.
#!HXPCreateController("HXP1", "164.54.204.49", 5001, 200, 200)

#asynSetTraceIOMask("HXP1", 0, 2)
#asynSetTraceMask("HXP1", 0, 255)

#Aux doesn't work with XPS-D8
# asynPort, IP address, IP port, poll period (ms)
#XPSAuxConfig("HXP_AUX1", "164.54.204.49", 5001, 50)
#asynSetTraceIOMask("HXP_AUX1", 0, 2)
#asynSetTraceMask("HXP_AUX1", 0, 255)

# XPS asyn port,  axis, groupName.positionerName, stepSize
#XPSCreateAxis("XPS1",0,"GROUP.PHI",      "1000")
# PR50PP
#XPSCreateAxis("XPS1",5,"Group6.Pos",   "50")
# ILS50PP
#XPSCreateAxis("XPS1",6,"Group7.Pos",   "2000")
# ILS50PP
#XPSCreateAxis("XPS1",7,"Group8.Pos",   "2000")

# XPS asyn port,  max points, FTP username, FTP password
# Note: this must be done after configuring axes
#XPSCreateProfile("XPS1", 2000, "Administrator", "Administrator")

iocInit

# This IOC does not use save/restore, so set values of some PVs
#dbpf("IOC:m1.RTRY", "0")
#dbpf("IOC:m1.TWV", "0.1")
#dbpf("IOC:m2.RTRY", "0")
#dbpf("IOC:m2.TWV", "0.1")
#dbpf("IOC:m3.RTRY", "0")
#dbpf("IOC:m3.TWV", "0.1")
#dbpf("IOC:m4.RTRY", "0")
#dbpf("IOC:m4.TWV", "0.1")
#dbpf("IOC:m5.RTRY", "0")
#dbpf("IOC:m5.TWV", "0.1")
#dbpf("18ID_D_Newport:m6.RTRY", "0")
#dbpf("18ID_D_Newport:m6.TWV", "0.1")
#dbpf("18ID_D_Newport:m7.RTRY", "0")
#dbpf("18ID_D_Newport:m7.TWV", "0.1")
#dbpf("18ID_D_Newport:m8.RTRY", "0")
#dbpf("18ID_D_Newport:m8.TWV", "0.1")
