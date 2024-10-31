TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = meas_comp_etc
# meas_comp_etc.dbd will be created and installed
DBD += meas_comp_etc.dbd

# meas_comp_etc.dbd will be made up from these files:
meas_comp_etc_DBD += base.dbd

# Include dbd files from all support applications:
meas_comp_etc_DBD += asyn.dbd
meas_comp_etc_DBD += busySupport.dbd
meas_comp_etc_DBD += asSupport.dbd
meas_comp_etc_DBD += calc.dbd
meas_comp_etc_DBD += scalerSupport.dbd
meas_comp_etc_DBD += sscan.dbd
meas_comp_etc_DBD += measCompSupport.dbd

# Add all the support libraries needed by this IOC
meas_comp_etc_LIBS += busy
meas_comp_etc_LIBS += autosave
meas_comp_etc_LIBS += asyn
meas_comp_etc_LIBS += calc
meas_comp_etc_LIBS += scaler
meas_comp_etc_LIBS += sscan
meas_comp_etc_LIBS += measComp

meas_comp_etc_SYS_LIBS += uldaq
meas_comp_etc_SYS_LIBS += usb-1.0

# meas_comp_etc_registerRecordDeviceDriver.cpp derives from meas_comp_etc.dbd
meas_comp_etc_SRCS += meas_comp_etc_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
meas_comp_etc_SRCS_DEFAULT += meas_comp_etcMain.cpp

# Finally link to the EPICS Base libraries
meas_comp_etc_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

