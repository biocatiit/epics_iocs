# vxWorks startup script

sysVmeMapShow

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

# If using a PowerPC CPU with more than 32MB of memory, and not building with longjump, then
# allocate enough memory here to force code to load in lower 32 MB.
mem = malloc(1024*1024*96)

### Load synApps EPICS software
ld < 18IDe.munch

cd startup

# Increase size of buffer for error logging from default 1256
errlogInit(20000)

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
# etc. in the software we just loaded (18IDe.munch)
dbLoadDatabase("../../dbd/ioc18IDeVX.dbd")
ioc18IDeVX_registerRecordDeviceDriver(pdbbase)

### save_restore setup
# We presume a suitable initHook routine was compiled into 18IDe.munch.
# See also create_monitor_set(), after iocInit() .
< save_restore.cmd

# Industry Pack support
#< industryPack.cmd

# serial support
#< serial.cmd

# gpib support
#< gpib.cmd

# VME devices
< vme.cmd

# CAMAC hardware
#<camac.cmd

# Motors  (also check vme.cmd)
#dbLoadTemplate("basic_motor.substitutions")
#!dbLoadTemplate("softMotor.substitutions")
#dbLoadTemplate("pseudoMotor.substitutions")

### Allstop, alldone
dbLoadRecords("$(MOTOR)/db/motorUtil.db", "P=18ID:e:")

### streamDevice example
#dbLoadRecords("$(TOP)/18IDeApp/Db/streamExample.db","P=18ID:e:,PORT=serial1")

### Insertion-device control
#dbLoadRecords("$(STD)/stdApp/Db/IDctrl.db","P=18ID:e:,xx=02us")

# sample-wheel
#dbLoadRecords("$(STD)/stdApp/Db/sampleWheel.db", "P=18ID:e:,ROWMOTOR=18ID:e:m7,ANGLEMOTOR=18ID:e:m8")

### Scan-support software
# crate-resident scan.  This executes 1D, 2D, 3D, and 4D scans, and caches
# 1D data, but it doesn't store anything to disk.  (See 'saveData' below for that.)
dbLoadRecords("$(SSCAN)/sscanApp/Db/scan.db","P=18ID:e:,MAXPTS1=8000,MAXPTS2=1000,MAXPTS3=10,MAXPTS4=10,MAXPTSH=8000")


### Stuff for user programming ###
dbLoadRecords("$(CALC)/calcApp/Db/userCalcs10.db","P=18ID:e:")
dbLoadRecords("$(CALC)/calcApp/Db/userCalcOuts10.db","P=18ID:e:")
dbLoadRecords("$(CALC)/calcApp/Db/userStringCalcs10.db","P=18ID:e:")
arrayCalcSize=2000
dbLoadRecords("$(CALC)/calcApp/Db/userArrayCalcs10.db","P=18ID:e:,N=2000")
dbLoadRecords("$(CALC)/calcApp/Db/userTransforms10.db","P=18ID:e:")
# extra userCalcs (must also load userCalcs10.db for the enable switch)
dbLoadRecords("$(CALC)/calcApp/Db/userCalcN.db","P=18ID:e:,N=I_Detector")
dbLoadRecords("$(CALC)/calcApp/Db/userAve10.db","P=18ID:e:")
# string sequence (sseq) records
dbLoadRecords("$(STD)/stdApp/Db/userStringSeqs10.db","P=18ID:e:")
# 4-step measurement
dbLoadRecords("$(STD)/stdApp/Db/4step.db", "P=18ID:e:")
# interpolation
dbLoadRecords("$(CALC)/calcApp/Db/interp.db", "P=18ID:e:,N=2000")
# array test
dbLoadRecords("$(CALC)/calcApp/Db/arrayTest.db", "P=18ID:e:,N=2000")

# pvHistory (in-crate archive of up to three PV's)
#dbLoadRecords("$(STD)/stdApp/Db/pvHistory.db","P=18ID:e:,N=1,MAXSAMPLES=1440")

# software timer
#dbLoadRecords("$(STD)/stdApp/Db/timer.db","P=18ID:e:,N=1")

# Slow feedback
dbLoadTemplate "pid_slow.substitutions"

# Miscellaneous PV's, such as burtResult
dbLoadRecords("$(STD)/stdApp/Db/misc.db","P=18ID:e:")
#dbLoadRecords("$(STD)/stdApp/Db/VXstats.db","P=18ID:e:")
# vxStats
dbLoadTemplate("vxStats.substitutions")


###############################################################################
# Set shell prompt (otherwise it is left at mv167 or mv162)
#shellPromptSet "iocvxWorks> "
iocLogDisable=0
iocInit

### startup State Notation Language programs
#seq &kohzuCtl, "P=18ID:e:, M_THETA=m9, M_Y=m10, M_Z=m11, GEOM=2, logfile=kohzuCtl.log"
### Example of specifying offset limits
##taskDelay(300)
##dbpf 18ID:e:kohzu_yOffsetAO.DRVH 17.51
##dbpf 18ID:e:kohzu_yOffsetAO.DRVL 17.49

#seq &hrCtl, "P=18ID:e:, N=1, M_PHI1=m9, M_PHI2=m10, logfile=hrCtl1.log"

# Keithley 2000 series DMM
# channels: 10, 20, or 22;  model: 2000 or 2700
#seq &Keithley2kDMM,("P=18ID:e:, Dmm=D1, channels=22, model=2700")
#seq &Keithley2kDMM,("P=18ID:e:, Dmm=D2, channels=10, model=2000")

# Bunch clock generator
#seq &getFillPat, "unit=18ID:e"

# X-ray Instrumentation Associates Huber Slit Controller
# supported by a SNL program written by Pete Jemian and modified (TMM) for use with the
# sscan record
#seq  &xia_slit, "name=hsc1, P=18ID:e:, HSC=hsc1:, S=18ID:e:asyn_6"

# Orientation-matrix
#seq &orient, "P=18ID:e:orient1:,PM=18ID:e:,mTTH=m13,mTH=m14,mCHI=m15,mPHI=m16"

# Start PF4 filter sequence program
#seq pf4Dual,"P=18ID:e:pf401:seq01:,MONO=,A0=,A1=,A2=,A3=,B0=,B1=,B2=,B3="

### Start up the autosave task and tell it what to do.
# The task is actually named "save_restore".

# Note that you can reload these sets after creating them: e.g., 
# reload_monitor_set("auto_settings.req",30,"P=18ID:e:")

save_restoreDebug=1
#
# save positions every five seconds

create_monitor_set("auto_positions.req",5,"P=18ID:e:")
# save other things every thirty seconds
##--May hang here.  If 30 seconds goes by with no response, reboot (^X)

create_monitor_set("auto_settings.req",30,"P=18ID:e:")

save_restoreDebug=0

### Start the saveData task.  If you start this task, scan records mentioned
# in saveData.req will *always* write data files.  There is no programmable
# disable for this software.
#saveData_Init("saveData.req", "P=18ID:e:")

# If memory allocated at beginning free it now
free(mem)

#!dbcar(0,1)

# motorUtil (allstop & alldone)
motorUtilInit("18ID:e:")

