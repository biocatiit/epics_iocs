TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = meas_comp
# meas_comp.dbd will be created and installed
DBD += meas_comp.dbd

# meas_comp.dbd will be made up from these files:
meas_comp_DBD += base.dbd

# Include dbd files from all support applications:
meas_comp_DBD += asyn.dbd
meas_comp_DBD += busySupport.dbd
meas_comp_DBD += asSupport.dbd
meas_comp_DBD += calc.dbd
meas_comp_DBD += scalerSupport.dbd
meas_comp_DBD += sscan.dbd
meas_comp_DBD += measCompSupport.dbd

# Add all the support libraries needed by this IOC
meas_comp_LIBS += busy
meas_comp_LIBS += autosave
meas_comp_LIBS += asyn
meas_comp_LIBS += calc
meas_comp_LIBS += scaler
meas_comp_LIBS += sscan
meas_comp_LIBS += measComp

meas_comp_SYS_LIBS += uldaq
meas_comp_SYS_LIBS += usb-1.0

# meas_comp_registerRecordDeviceDriver.cpp derives from meas_comp.dbd
meas_comp_SRCS += meas_comp_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
meas_comp_SRCS_DEFAULT += meas_compMain.cpp

# Finally link to the EPICS Base libraries
meas_comp_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

