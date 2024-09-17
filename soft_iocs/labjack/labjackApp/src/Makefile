TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = labjack
# labjack.dbd will be created and installed
DBD += labjack.dbd

# labjack.dbd will be made up from these files:
labjack_DBD += base.dbd

# Include dbd files from all support applications:
labjack_DBD += base.dbd
labjack_DBD += asyn.dbd
labjack_DBD += busySupport.dbd
labjack_DBD += asSupport.dbd
labjack_DBD += LabJackSupport.dbd

# Add all the support libraries needed by this IOC
labjack_LIBS += LabJack
labjack_LIBS += busy
labjack_LIBS += autosave
labjack_LIBS += asyn
labjack_LIBS += LabJackM

# labjack_registerRecordDeviceDriver.cpp derives from labjack.dbd
labjack_SRCS += labjack_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
labjack_SRCS_DEFAULT += labjackMain.cpp

# Add support from base/src/vxWorks if needed
#labjack_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
labjack_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

