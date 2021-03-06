# vxWorks startup script

sysVmeMapShow

memShow

# for vxStats
#putenv "engineer=not me"
#putenv "location=Earth"
engineer="D. Gore"
location="BioCAT"

cd ""
< ../nfsCommands
< cdCommands

# How to set and get the clock rate
#sysClkRateSet(100)
#sysClkRateGet()

################################################################################
cd topbin

# If the VxWorks kernel was built using the project facility, the following must
# be added before any C++ code is loaded (see SPR #28980).
sysCplusEnable=1

#memShow
### Load synApps EPICS software
ld < 18IDd.munch

cd startup

# Increase size of buffer for error logging from default 1256
errlogInit(2000)

# override address, interrupt vector, etc. information in module_types.h
#module_types()

# need more entries in wait/scan-record channel-access queue?
recDynLinkQsize = 1024

# Specify largest array CA will transport
# Note for N sscanRecord data points, need (N+1)*8 bytes, else MEDM
# plot doesn't display
putenv "EPICS_CA_MAX_ARRAY_BYTES=64008"

# set the protocol path for streamDevice
#epicsEnvSet("STREAM_PROTOCOL_PATH", ".")

################################################################################
# Tell EPICS all about the record types, device-support modules, drivers,
# etc. in the software we just loaded (18IDd.munch)
dbLoadDatabase("../../dbd/ioc18IDdVX.dbd")
ioc18IDdVX_registerRecordDeviceDriver(pdbbase)

### save_restore setup
# We presume a suitable initHook routine was compiled into 18IDd.munch.
# See also create_monitor_set(), after iocInit() .
< save_restore.cmd

# Industry Pack support
< industryPack.cmd

# serial support
#< serial.cmd

# VME devices
< vme.cmd

# CAMAC hardware
#< camac.cmd

# BioCAT Specific Databases
< biocat.cmd

# Motors  (also check vme.cmd)
#dbLoadTemplate("basic_motor.substitutions")
#!dbLoadTemplate("softMotor.substitutions")
#dbLoadTemplate("pseudoMotor.substitutions")

### Allstop, alldone
#dbLoadRecords("$(MOTOR)/db/motorUtil.db", "P=18ID:")

### streamDevice example
#dbLoadRecords("$(TOP)/18IDdApp/Db/streamExample.db","P=18ID:,PORT=serial1")

### Insertion-device control
#dbLoadRecords("$(STD)/stdApp/Db/IDctrl.db","P=18ID:,xx=02us")

### Scan-support software
# crate-resident scan.  This executes 1D, 2D, 3D, and 4D scans, and caches
# 1D data, but it doesn't store anything to disk.  (See 'saveData' below for that.)
#dbLoadRecords("$(SSCAN)/sscanApp/Db/scan.db","P=18ID:,MAXPTS1=8000,MAXPTS2=1000,MAXPTS3=10,MAXPTS4=10,MAXPTSH=8000")
dbLoadRecords("$(SSCAN)/sscanApp/Db/scan.db","P=18ID:,MAXPTS1=8000,MAXPTS2=1000,MAXPTS3=10,MAXPTS4=10,MAXPTSH=8000")


### Stuff for user programming ###
< calc.cmd

# 4-step measurement
dbLoadRecords("$(STD)/stdApp/Db/4step.db", "P=18ID:,Q=4step:")

# pvHistory (in-crate archive of up to three PV's)
#dbLoadRecords("$(STD)/stdApp/Db/pvHistory.db","P=18ID:,N=1,MAXSAMPLES=1440")

# software timer
#dbLoadRecords("$(STD)/stdApp/Db/timer.db","P=18ID:,N=1")

# Slow feedback
#dbLoadTemplate "pid_slow.substitutions"

# Miscellaneous PV's, such as burtResult
dbLoadRecords("$(STD)/stdApp/Db/misc.db","P=18ID:")
#dbLoadRecords("$(STD)/stdApp/Db/VXstats.db","P=18ID:")
#vxStats
#dbLoadTemplate("vxStats.substitutions")

# BPM calcs
< bpm.cmd

# Vacuum guage calcuations
< vac.cmd

###############################################################################
# Set shell prompt (otherwise it is left at mv167 or mv162)
#shellPromptSet "iocbio4> "
iocLogDisable=0
iocInit

memShow

### startup State Notation Language programs
# 2017-09-28 Commented out by William Lavender, since the Keithley support will
#            now be handled by the MX Prologix driver running off of fiend.
###seq &k428, "name=k428_10, P=18ID:k428-10:, G=18ID:gpib1:k428-10, A=10"
###epicsThreadSleep(2)
###seq &k428, "name=k428_11, P=18ID:k428-11:, G=18ID:gpib1:k428-11, A=11"
###epicsThreadSleep(2)
###seq &k428, "name=k428_12, P=18ID:k428-12:, G=18ID:gpib1:k428-12, A=12"
###epicsThreadSleep(2)
###seq &k428, "name=k428_13, P=18ID:k428-13:, G=18ID:gpib1:k428-13, A=13"
###epicsThreadSleep(2)

#seq &kohzuCtl, "P=18ID:, M_THETA=m9, M_Y=m10, M_Z=m11, GEOM=2, logfile=kohzuCtl.log"
### Example of specifying offset limits
##taskDelay(300)
##dbpf 18ID:kohzu_yOffsetAO.DRVH 17.51
##dbpf 18ID:kohzu_yOffsetAO.DRVL 17.49

#seq &hrCtl, "P=18ID:, N=1, M_PHI1=m9, M_PHI2=m10, logfile=hrCtl1.log"

# Keithley 2000 series DMM
# channels: 10, 20, or 22;  model: 2000 or 2700
#seq &Keithley2kDMM,("P=18ID:, Dmm=D1, channels=22, model=2700")
#seq &Keithley2kDMM,("P=18ID:, Dmm=D2, channels=10, model=2000")

# Bunch clock generator
#seq &getFillPat, "unit=18ID"

# X-ray Instrumentation Associates Huber Slit Controller
# supported by a SNL program written by Pete Jemian and modified (TMM) for use with the
# sscan record
#seq  &xia_slit, "name=hsc1, P=18ID:, HSC=hsc1:, S=18ID:asyn_6"

# Orientation-matrix
#seq &orient, "P=18ID:orient1:,PM=18ID:,mTTH=m13,mTH=m14,mCHI=m15,mPHI=m16"

# Start PF4 filter sequence program
#seq pf4Dual,"P=18ID:pf401:seq01:,MONO=,A0=,A1=,A2=,A3=,B0=,B1=,B2=,B3="

### Start up the autosave task and tell it what to do.
# The task is actually named "save_restore".

save_restoreDebug=0
# Note that you can reload these sets after creating them: e.g., 
# reload_monitor_set("auto_settings.req",30,"P=18ID:")
#reload_monitor_set("auto_settings_18ID.req",30,"P=18ID:")
#
# save positions every five seconds
#create_monitor_set("auto_positions.req",5,"P=18ID:")
# save other things every thirty seconds
##--May hang here.  If 30 seconds goes by with no response, reboot (^X)
create_monitor_set("auto_settings.req",30,"P=18ID:")
#create_monitor_set("auto_settings.req",30,"P=18ID:")

### Start the saveData task.  If you start this task, scan records mentioned
# in saveData.req will *always* write data files.  There is no programmable
# disable for this software.
saveData_Init("saveData.req", "P=18ID:")

#!dbcar(0,1)

# motorUtil (allstop & alldone)
#motorUtilInit("18ID:")

