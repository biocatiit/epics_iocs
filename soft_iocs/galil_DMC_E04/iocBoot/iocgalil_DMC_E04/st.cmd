#!../../bin/linux-x86_64/galil_DMC_E04

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/galil_DMC_E04.dbd",0,0)
galil_DMC_E04_registerRecordDeviceDriver(pdbbase)

cd ${TOP}/iocBoot/${IOC}

##################################################################################################
# Configuration settings

# IOC record prefix used for sscan/saveData databases and autosave setup
epicsEnvSet("IOCPREFIX", "IOC_18ID_DMC_E04:")

# Configure an example DMC (digital motor controller)
< 18ID_DMC_E04Configure.cmd

# Configure an example RIO (Remote IO PLC controller)
#< RIO01Configure.cmd

##################################################################################################

### Scan-support software
# crate-resident scan.  This executes 1D, 2D, 3D, and 4D scans, and caches
# 1D data, but it doesn't store anything to disk.  (See 'saveData' below for that.)
dbLoadRecords("$(SSCAN)/sscanApp/Db/standardScans.db","P=$(IOCPREFIX),MAXPTS1=8000,MAXPTS2=1000,MAXPTS3=10,MAXPTS4=10,MAXPTSH=8000")
dbLoadRecords("$(SSCAN)/sscanApp/Db/saveData.db","P=$(IOCPREFIX)")

##################################################################################################

### Set up slit pseudo motors
dbLoadRecords("$(OPTICS)/opticsApp/Db/2slit_soft.vdb","P=18ID_DMC_E04:,SLIT=XenocsUS_V:,mXp=25,mXn=26")
dbLoadRecords("$(OPTICS)/opticsApp/Db/2slit_soft.vdb","P=18ID_DMC_E04:,SLIT=XenocsUS_H:,mXp=28,mXn=27")
dbLoadRecords("$(OPTICS)/opticsApp/Db/2slit_soft.vdb","P=18ID_DMC_E04:,SLIT=XenocsDS_V:,mXp=29,mXn=30")
dbLoadRecords("$(OPTICS)/opticsApp/Db/2slit_soft.vdb","P=18ID_DMC_E04:,SLIT=XenocsDS_H:,mXp=32,mXn=31")

##################################################################################################

< autosave.cmd

# Start the IOC
iocInit()

# Initialize saveData for step scans
saveData_Init("saveData.req", "P=$(IOCPREFIX)")

##################################################################################################
# Configuration settings

# Create DMC autosave monitor sets
< 18ID_DMC_E04CreateMonitorSet.cmd

# Create RIO autosave monitor sets
#< RIO01CreateMonitorSet.cmd

# Slit autosave monitor sets
create_monitor_set("slit_settings.req",30,"P=18ID_DMC_E04:")

##################################################################################################
date
# end

