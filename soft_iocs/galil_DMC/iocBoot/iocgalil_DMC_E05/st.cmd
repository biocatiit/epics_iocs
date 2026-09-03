#!../../bin/linux-x86_64/galil_DMC

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/galil_DMC.dbd",0,0)
galil_DMC_registerRecordDeviceDriver(pdbbase)

cd ${TOP}/iocBoot/${IOC}

##################################################################################################
# Configuration settings

# IOC record prefix used for sscan/saveData databases and autosave setup
epicsEnvSet("IOCPREFIX", "IOC_18ID_DMC_E05:")

# Configure an example DMC (digital motor controller)
< 18ID_DMC_E05Configure.cmd

# Configure an example RIO (Remote IO PLC controller)
#< RIO01Configure.cmd

##################################################################################################

### Scan-support software
# crate-resident scan.  This executes 1D, 2D, 3D, and 4D scans, and caches
# 1D data, but it doesn't store anything to disk.  (See 'saveData' below for that.)
dbLoadRecords("$(SSCAN)/sscanApp/Db/standardScans.db","P=$(IOCPREFIX),MAXPTS1=8000,MAXPTS2=1000,MAXPTS3=10,MAXPTS4=10,MAXPTSH=8000")
dbLoadRecords("$(SSCAN)/sscanApp/Db/saveData.db","P=$(IOCPREFIX)")

##################################################################################################


### Optical tables
#tableRecordDebug=1
#dbLoadRecords("$(OPTICS)/db/table.db","P=,Q=18ID:ADCTable,T=18ID:ADCTable,M0X=18ID_DMC_E05:36,M0Y=18ID_DMC_E05:34,M1Y=18ID_DMC_E05:37,M2X=18ID_DMC_E05:35,M2Y=18ID_DMC_E05:33,M2Z=m6,GEOM=PNC")
dbLoadRecords("$(OPTICS)/opticsApp/Db/table_soft.vdb", "P=,Q=18ID:ADCTable,T=18ID:ADCTable,M0X=18ID_DMC_E05:36,M0Y=18ID_DMC_E05:34,M1Y=18ID_DMC_E05:37,M2X=18ID_DMC_E05:35,M2Y=18ID_DMC_E05:33,M2Z=m6,GEOM=PNC")
dbLoadRecords("./table_soft_helper.db", "P=,Q=18ID:ADCTable")


# restore table settings
#set_pass0_restoreFile("table_settings.sav")
set_pass0_restoreFile("table_soft_settings.sav")

##################################################################################################

< autosave.cmd

# Start the IOC
iocInit()

# Initialize saveData for step scans
saveData_Init("saveData.req", "P=$(IOCPREFIX)")

##################################################################################################
# Configuration settings

# Create DMC autosave monitor sets
< 18ID_DMC_E05CreateMonitorSet.cmd

# Create RIO autosave monitor sets
#< RIO01CreateMonitorSet.cmd

# ADC Table autosave settings
# Save ADC table calibration every 30 seconds
#create_monitor_set("table_settings.req", 30,"P=,Q=18ID:ADCTable,T=18ID:ADCTable")
create_monitor_set("table_soft_settings.req", 30,"P=,Q=18ID:ADCTable,T=18ID:ADCTable")


##################################################################################################
date
# end

