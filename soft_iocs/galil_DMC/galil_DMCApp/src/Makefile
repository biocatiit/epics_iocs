TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = galil_DMC
# galil_DMC.dbd will be created and installed
DBD += galil_DMC.dbd

# galil_DMC.dbd will be made up from these files:
galil_DMC_DBD += base.dbd

# Include dbd files from all support applications:
galil_DMC_DBD += asyn.dbd
galil_DMC_DBD += drvAsynSerialPort.dbd
galil_DMC_DBD += drvAsynIPPort.dbd
galil_DMC_DBD += motorSupport.dbd
galil_DMC_DBD += devSoftMotor.dbd
galil_DMC_DBD += calcSupport.dbd
galil_DMC_DBD += sscanSupport.dbd
galil_DMC_DBD += asSupport.dbd
galil_DMC_DBD += busySupport.dbd
galil_DMC_DBD += opticsSupport.dbd
galil_DMC_DBD += GalilSupport.dbd

# Add all the support libraries needed by this IOC
galil_DMC_LIBS += GalilSupport
galil_DMC_LIBS += motor busy asyn calc sscan autosave optics softMotor
ifdef SNCSEQ
galil_DMC_LIBS += seq pv
endif

# galil_DMC_registerRecordDeviceDriver.cpp derives from galil_DMC.dbd
galil_DMC_SRCS += galil_DMC_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
galil_DMC_SRCS_DEFAULT += galil_DMCMain.cpp

# Finally link to the EPICS Base libraries
galil_DMC_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

