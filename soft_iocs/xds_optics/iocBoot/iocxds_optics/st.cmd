#!../../bin/linux-x86_64/xds_optics

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/xds_optics.dbd",0,0)
xds_optics_registerRecordDeviceDriver(pdbbase)

cd ${TOP}/iocBoot/${IOC}

##################################################################################################
# Configuration settings

# IOC record prefix used for sscan/saveData databases and autosave setup
epicsEnvSet("IOCPREFIX", "IOC_18ID_OPTICS:")

# IOC broadcast only on the main BioCAT LAN, not on the GALIL subnet
epicsEnvSet("EPICS_CAS_INTF_ADDR_LIST", "164.54.204.82")
epicsEnvSet("EPICS_CAS_AUTO_BEACON_ADDR_LIST", "NO")
epicsEnvSet("EPICS_CAS_BEACON_ADDR_LIST", "164.54.204.255")
epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST", "164.54.204.255")

# Configure an example DMC (digital motor controller)
< 18ID_DMC_E06Configure.cmd
< 18ID_DMC_E07Configure.cmd
< 18ID_DMC_E08Configure.cmd

##################################################################################################

### Scan-support software for GALIL
# crate-resident scan.  This executes 1D, 2D, 3D, and 4D scans, and caches
# 1D data, but it doesn't store anything to disk.  (See 'saveData' below for that.)
dbLoadRecords("$(SSCAN)/sscanApp/Db/standardScans.db","P=IOC_$(P1),MAXPTS1=8000,MAXPTS2=1000,MAXPTS3=10,MAXPTS4=10,MAXPTSH=8000")
dbLoadRecords("$(SSCAN)/sscanApp/Db/saveData.db","P=IOC_$(P1)")
dbLoadRecords("$(SSCAN)/sscanApp/Db/standardScans.db","P=IOC_$(P2),MAXPTS1=8000,MAXPTS2=1000,MAXPTS3=10,MAXPTS4=10,MAXPTSH=8000")
dbLoadRecords("$(SSCAN)/sscanApp/Db/saveData.db","P=IOC_$(P2)")
dbLoadRecords("$(SSCAN)/sscanApp/Db/standardScans.db","P=IOC_$(P3),MAXPTS1=8000,MAXPTS2=1000,MAXPTS3=10,MAXPTS4=10,MAXPTSH=8000")
dbLoadRecords("$(SSCAN)/sscanApp/Db/saveData.db","P=IOC_$(P3)")

##################################################################################################

## motorUtil (allstop & alldone)
#dbLoadRecords("$(MOTOR)/db/motorUtil.db", "P=automation1:")

## Automation1 Support
< automation1.cmd

##################################################################################################

##################################################################################################

# Set up mono using Bragg-Gap control from Optics package 
# Simple mono (Bragg and Gap) - Creates energy and offset positioners
iocshLoad("simpleMono.iocsh", "PREFIX=18ID:, INSTANCE=Mono, BRAGGMOTOR=18ID_Aerotech_C:m1, GAPMOTOR=18ID_DMC_E08:C24")

##################################################################################################

### Set up slit pseudo motors
#dbLoadRecords("$(OPTICS)/opticsApp/Db/2slit_soft.vdb","P=18ID_DMC_E01:,SLIT=JJ_D_V:,mXp=1,mXn=2")
#dbLoadRecords("$(OPTICS)/opticsApp/Db/2slit_soft.vdb","P=18ID_DMC_E01:,SLIT=JJ_D_H:,mXp=4,mXn=3")

##################################################################################################

< autosave.cmd

# Start the IOC
iocInit()

## motorUtil (allstop & alldone)
#motorUtilInit("automation1:")

# Initialize saveData for step scans
#saveData_Init("saveData.req", "P=$(IOCPREFIX)")

##################################################################################################
# Configuration settings

# Create DMC autosave monitor sets
< createDMCMonitorSet.cmd

# Create Mono autosave monitor sets
< createMonoMonitorSet.cmd

# Slit autosave monitor sets
#create_monitor_set("slit_settings.req",30,"P=18ID_DMC_E01:")

##################################################################################################

# Automation1 does not use save/restore, so set values of some PVs
dbpf("18ID_Aerotech_C:m1.RTRY", "0")
dbpf("18ID_Aerotech_C:m1.TWV", "0.1")

date
# end

