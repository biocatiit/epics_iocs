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

PROD_IOC = toaster
# toaster.dbd will be created and installed
DBD += toaster.dbd

# toaster.dbd will be made up from these files:
toaster_DBD += base.dbd

# Include dbd files from all support applications:
toaster_DBD += busySupport.dbd
toaster_DBD += asSupport.dbd
toaster_DBD += calc.dbd

# Add all the support libraries needed by this IOC
toaster_LIBS += busy
toaster_LIBS += autosave
toaster_LIBS += calc
toaster_LIBS += seq pv

# Add all the support libraries needed by this IOC
#toaster_LIBS += xxx

# toaster_registerRecordDeviceDriver.cpp derives from toaster.dbd
toaster_SRCS += toaster_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
toaster_SRCS_DEFAULT += toasterMain.cpp
toaster_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#toaster_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
toaster_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

