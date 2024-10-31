TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = galil_DMC_E01
# galil_DMC_E01.dbd will be created and installed
DBD += galil_DMC_E01.dbd

# galil_DMC_E01.dbd will be made up from these files:
galil_DMC_E01_DBD += base.dbd

# Include dbd files from all support applications:
galil_DMC_E01_DBD += asyn.dbd
galil_DMC_E01_DBD += drvAsynSerialPort.dbd
galil_DMC_E01_DBD += drvAsynIPPort.dbd
galil_DMC_E01_DBD += motorSupport.dbd
galil_DMC_E01_DBD += devSoftMotor.dbd
galil_DMC_E01_DBD += calcSupport.dbd
galil_DMC_E01_DBD += sscanSupport.dbd
galil_DMC_E01_DBD += asSupport.dbd
galil_DMC_E01_DBD += busySupport.dbd
galil_DMC_E01_DBD += opticsSupport.dbd
galil_DMC_E01_DBD += GalilSupport.dbd

# Add all the support libraries needed by this IOC
galil_DMC_E01_LIBS += GalilSupport
galil_DMC_E01_LIBS += motor busy asyn calc sscan autosave optics softMotor
ifdef SNCSEQ
galil_DMC_E01_LIBS += seq pv
endif

# galil_DMC_E01_registerRecordDeviceDriver.cpp derives from galil_DMC_E01.dbd
galil_DMC_E01_SRCS += galil_DMC_E01_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
galil_DMC_E01_SRCS_DEFAULT += galil_DMC_E01Main.cpp

# Finally link to the EPICS Base libraries
galil_DMC_E01_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

