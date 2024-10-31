TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = meas_comp_e1608
# meas_comp_e1608.dbd will be created and installed
DBD += meas_comp_e1608.dbd

# meas_comp_e1608.dbd will be made up from these files:
meas_comp_e1608_DBD += base.dbd

# Include dbd files from all support applications:
meas_comp_e1608_DBD += asyn.dbd
meas_comp_e1608_DBD += busySupport.dbd
meas_comp_e1608_DBD += asSupport.dbd
meas_comp_e1608_DBD += calc.dbd
meas_comp_e1608_DBD += scalerSupport.dbd
meas_comp_e1608_DBD += sscan.dbd
meas_comp_e1608_DBD += measCompSupport.dbd

# Add all the support libraries needed by this IOC
meas_comp_e1608_LIBS += busy
meas_comp_e1608_LIBS += autosave
meas_comp_e1608_LIBS += asyn
meas_comp_e1608_LIBS += calc
meas_comp_e1608_LIBS += scaler
meas_comp_e1608_LIBS += sscan
meas_comp_e1608_LIBS += measComp

meas_comp_e1608_SYS_LIBS += uldaq
meas_comp_e1608_SYS_LIBS += usb-1.0

# meas_comp_e1608_registerRecordDeviceDriver.cpp derives from meas_comp_e1608.dbd
meas_comp_e1608_SRCS += meas_comp_e1608_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
meas_comp_e1608_SRCS_DEFAULT += meas_comp_e1608Main.cpp

# Finally link to the EPICS Base libraries
meas_comp_e1608_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

