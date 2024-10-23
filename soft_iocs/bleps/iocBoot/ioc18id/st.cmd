#!../../bin/linux-x86_64/18id
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

### Remote shutter sequences ###
< rshtr.cmd

# devIocStats
#dbLoadRecords("$(DEVIOCSTATS)/db/iocAdminSoft.db","IOC=18id")

###############################################################################
# Configure auto save/restore
< save_restore.cmd

###############################################################################
iocInit
###############################################################################

# write all the PV names to a local file
dbl > dbl-all.txt

# Diagnostic: CA links in all records
#dbcar(0,1)

# print the time our boot was finished
date

