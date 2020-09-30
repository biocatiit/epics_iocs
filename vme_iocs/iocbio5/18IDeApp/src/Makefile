TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

# For Kate Feng's implementation of devScaler.c, which uses Till
# Straumann's basicIoOps.h to bridge any mismatch between endianness
# of Joerger scaler hardware and endianness of processor.
#USR_CFLAGS += -DHAS_IOOPS_H

#==================================================
# build a support library that some other application can use

#LIBRARY_IOC += 18IDeSupport

# 18IDeRecord.h will be created from 18IDeRecord.dbd
#DBDINC += 18IDeRecord
# install support-library .dbd into <top>/dbd
#DBD += 18IDeSupport.dbd

# The following are compiled and added to the Support library
#18IDeSupport_SRCS += 18IDeRecord.c

#18IDeSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# build an ioc application

PROD_IOC_DEFAULT = 18IDe
PROD_IOC_solaris = 18IDe

# <name>.dbd will be created from <name>Include.dbd
ifeq ($(OS_CLASS), WIN32)
DBD  += ioc18IDeWin32.dbd
else
ifeq ($(EPICS_HOST_ARCH), cygwin-x86)
DBD  += ioc18IDeCygwin.dbd
else
DBD  += ioc18IDe.dbd
DBD  += ioc18IDeVX.dbd
DBD  += ioc18IDeLinux.dbd
DBD  += ioc18IDe_solaris.dbd
endif
endif

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
18IDe_SRCS_DEFAULT  += ioc18IDe_registerRecordDeviceDriver.cpp          18IDeMain.cpp
18IDe_SRCS_vxWorks  += ioc18IDeVX_registerRecordDeviceDriver.cpp
18IDe_SRCS_Linux    += ioc18IDeLinux_registerRecordDeviceDriver.cpp     18IDeMain.cpp
18IDe_SRCS_WIN32    += ioc18IDeWin32_registerRecordDeviceDriver.cpp     18IDeMain.cpp
18IDe_SRCS_cygwin32 += ioc18IDeCygwin_registerRecordDeviceDriver.cpp    18IDeMain.cpp
18IDe_SRCS_solaris  += ioc18IDe_solaris_registerRecordDeviceDriver.cppa 18IDeMain.cpp
18IDe_SRCS_vxWorks  += -nil-

#18IDe_Common_LIBS += 18IDeSupport
18IDe_Common_LIBS += genSub
18IDe_Common_LIBS += mca
18IDe_Common_LIBS += calc
18IDe_Common_LIBS += sscan
18IDe_Common_LIBS += autosave
18IDe_Common_LIBS += optics
18IDe_Common_LIBS += vme
18IDe_Common_LIBS += std
18IDe_Common_LIBS += ip
18IDe_Common_LIBS += brukerCCD
18IDe_Common_LIBS += marCCD
18IDe_Common_LIBS += roperCCD

18IDe_Common_LIBS += Acs Faulhaber Ims Mclennan Micos MicroMo NewFocus
18IDe_Common_LIBS += Newport PI Parker
18IDe_Common_LIBS +=  softMotor motorSimSupport motor

18IDe_Common_LIBS += asyn
#18IDe_Common_LIBS += stream streamSynApps
18IDe_Common_LIBS += seq pv seqDev
18IDe_Common_LIBS += $(EPICS_BASE_IOC_LIBS)

18IDe_vxWorks_LIBS += allenBradley
18IDe_vxWorks_LIBS += mcaSIS
18IDe_vxWorks_LIBS += mcaCanberra
18IDe_vxWorks_LIBS += ip330
18IDe_vxWorks_LIBS += ipUnidig
18IDe_vxWorks_LIBS += dac128V
18IDe_vxWorks_LIBS += quadEM
18IDe_vxWorks_LIBS += camac devCamac
18IDe_vxWorks_LIBS += dxp handelSrc
#18IDe_vxWorks_LIBS += love
18IDe_vxWorks_LIBS += vxStats
18IDe_vxWorks_LIBS += TyGSOctal Ipac
18IDe_vxWorks_LIBS += oms DeltaTau

#The following adds support from base/src/vxWorks
18IDe_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

18IDe_Linux_LIBS  += dxp handelSrc
# If libnet IS installed on your HOST Linux system;
# uncomment the following line.
#18IDe_Linux_LIBS  += mcaCanberra

18IDe_cygwin_LIBS += dxp handelSrc

18IDe_WIN32_LIBS += dxp handelSrc

18IDe_solaris_LIBS += genSub
#18IDe_solaris_LIBS += mca
18IDe_solaris_LIBS += calc
18IDe_solaris_LIBS += sscan
18IDe_solaris_LIBS += autosave
18IDe_solaris_LIBS += optics
#18IDe_solaris_LIBS += vme
18IDe_solaris_LIBS += std
#18IDe_solaris_LIBS += ip
#18IDe_solaris_LIBS += brukerCCD
#18IDe_solaris_LIBS += marCCD
#18IDe_solaris_LIBS += roperCCD
18IDe_solaris_LIBS += motor softMotor
18IDe_solaris_LIBS += asyn
18IDe_solaris_LIBS += seq pv seqDev
18IDe_solaris_LIBS += $(EPICS_BASE_IOC_LIBS)


18IDe_LIBS_DEFAULT = $(18IDe_Common_LIBS)
18IDe_LIBS_vxWorks = $(18IDe_vxWorks_LIBS) $(18IDe_Common_LIBS)
18IDe_LIBS_Linux   = $(18IDe_Linux_LIBS)   $(18IDe_Common_LIBS)
18IDe_LIBS_solaris = $(18IDe_solaris_LIBS)
18IDe_LIBS_cygwin32 = $(18IDe_cygwin_LIBS) $(18IDe_Common_LIBS)
18IDe_LIBS_WIN32    = $(18IDe_WIN32_LIBS)  $(18IDe_Common_LIBS)

# If the host has libnet and libpcap for mca/Canberra support
# uncomment the following line.
#18IDe_SYS_LIBS_Linux += net pcap
18IDe_SYS_LIBS_vxWorks += -nil-

# This is needed by dxp on cygwin and WIN32
18IDe_SYS_LIBS_cygwin32 += DLPORTIO
18IDe_LIBS_WIN32        += DLPORTIO
# This is needed by saveData and asyn VXI-11 on cygwin
18IDe_SYS_LIBS_cygwin32 += rpc


#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
