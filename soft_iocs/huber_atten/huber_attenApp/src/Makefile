# SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#
# SPDX-License-Identifier: EPICS

TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = huber_atten
# huber_atten.dbd will be created and installed
DBD += huber_atten.dbd

# huber_atten.dbd will be made up from these files:
huber_atten_DBD += base.dbd

# Include dbd files from all support applications:
huber_atten_DBD += asyn.dbd
huber_atten_DBD += drvAsynIPPort.dbd
huber_atten_DBD += asSupport.dbd
huber_atten_DBD += calc.dbd
huber_atten_DBD += modbusSupport.dbd
huber_atten_DBD += devIocStats.dbd iocAdmin.dbd

# Add all the support libraries needed by this IOC
huber_atten_LIBS += asyn
huber_atten_LIBS += busy
huber_atten_LIBS += autosave
huber_atten_LIBS += calc
huber_atten_LIBS += modbus
huber_atten_LIBS += devIocStats

# huber_atten_registerRecordDeviceDriver.cpp derives from huber_atten.dbd
huber_atten_SRCS += huber_atten_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
huber_atten_SRCS_DEFAULT += huber_attenMain.cpp
huber_atten_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#huber_atten_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
huber_atten_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

