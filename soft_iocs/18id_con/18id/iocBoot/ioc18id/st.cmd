# Linux startup script

< envPaths

# Increase size of buffer for error logging from default 1256
errlogInit(20000)

################################################################################
# Tell EPICS all about the record types, device-support modules, drivers,
# etc. in the software we just loaded (18id.munch)
dbLoadDatabase("../../dbd/ioc18idLinux.dbd")
ioc18idLinux_registerRecordDeviceDriver(pdbbase)

< common.iocsh

#< iocsh/motors.iocsh

###   Beamline EPS Support   ###
< bleps.cmd

###   LabJack Support   ###
< LabJack_T4_1.cmd

### Remote shutter sequences ###
< rshtr.cmd

# devIocStats
dbLoadRecords("$(DEVIOCSTATS)/db/iocAdminSoft.db","IOC=18id")

###############################################################################
# Configure auto save/restore
< save_restore.cmd

###############################################################################
iocInit
###############################################################################

# write all the PV names to a local file
dbl > dbl-all.txt

# Diagnostic: CA links in all records
dbcar(0,1)

###
### Set digital outputs low, otherwise they float
###
# Must match the substitions file PV names
dbpf 18ID:LJT4:1:DO0 0
dbpf 18ID:LJT4:1:DO1 0
dbpf 18ID:LJT4:1:DO2 0
dbpf 18ID:LJT4:1:DO3 0
dbpf 18ID:LJT4:1:DO4 0
dbpf 18ID:LJT4:1:DO5 0
dbpf 18ID:LJT4:1:DO6 0
dbpf 18ID:LJT4:1:DO7 0
dbpf 18ID:LJT4:1:DO8 0
dbpf 18ID:LJT4:1:DO9 0
dbpf 18ID:LJT4:1:DO10 0
dbpf 18ID:LJT4:1:DO11 0
dbpf 18ID:LJT4:1:DO12 0
dbpf 18ID:LJT4:1:DO13 0
dbpf 18ID:LJT4:1:DO14 0
dbpf 18ID:LJT4:1:DO15 0

# print the time our boot was finished
date

