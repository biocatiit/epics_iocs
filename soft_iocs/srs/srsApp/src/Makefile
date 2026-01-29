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

PROD_IOC = srs
# srs.dbd will be created and installed
DBD += srs.dbd

# srs.dbd will be made up from these files:
srs_DBD += base.dbd

# Include dbd files from all support applications:
srs_DBD += asyn.dbd
srs_DBD += drvAsynIPPort.dbd drvAsynSerialPort.dbd
#srs_DBD += stream.dbd
srs_DBD += busySupport.dbd
srs_DBD += asSupport.dbd
srs_DBD += calc.dbd
srs_DBD += ipSupport.dbd
srs_DBD += delaygenSupport.dbd
srs_DBD += devIocStats.dbd iocAdmin.dbd

# Add all the support libraries needed by this IOC
srs_LIBS += asyn
#srs_LIBS += stream
srs_LIBS += busy
srs_LIBS += autosave
srs_LIBS += calc
srs_LIBS += ip
srs_LIBS += delaygen
srs_LIBS += devIocStats

# srs_registerRecordDeviceDriver.cpp derives from srs.dbd
srs_SRCS += srs_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
srs_SRCS_DEFAULT += srsMain.cpp
#srs_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#srs_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
srs_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

