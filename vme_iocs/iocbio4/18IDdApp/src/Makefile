TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

# For Kate Feng's implementation of devScaler.c, which uses Till
# Straumann's basicIoOps.h to bridge any mismatch between endianness
# of Joerger scaler hardware and endianness of processor.
#USR_CFLAGS += -DHAS_IOOPS_H

#=============================
# build an ioc application

PROD_IOC = 18IDd

# Note that the order in which .dbd files and libraries are added to a list
# variable is important.  For .dbd files, things must be defined before they
# are referenced by a later .dbd file.  For libraries, things must be referenced
# before they are searched for; otherwise they won't be included.

# Custom stuff
18IDd_SRCS += k428.st
18IDd_Common_DBD += k428.dbd

##################################################################
# First, define 18IDd_Common_DBD and 18IDd_Common_LIBS from the modules
# defined in RELEASE
##################################################################
DBD += 18IDd_Common.dbd
18IDd_Common_DBD += base.dbd

#ifdef CAPUTLOG
#	18IDd_Common_DBD += caPutLog.dbd
#	18IDd_Common_LIBS := caPutLog $(18IDd_Common_LIBS)
#endif

ifdef CAPUTRECORDER
	18IDd_Common_DBD += caputRecorder.dbd
	18IDd_Common_LIBS := caputRecorder $(18IDd_Common_LIBS)
endif

ifdef SNCSEQ
	ifeq (seq-2-1, $(findstring seq-2-1, $(SNCSEQ)))
		18IDd_Common_DBD += devSequencer.dbd
		18IDd_Common_LIBS := seqDev seq pv $(18IDd_Common_LIBS)
	else ifeq (seq-2.1, $(findstring seq-2.1, $(SNCSEQ)))
		18IDd_Common_DBD += devSequencer.dbd
		18IDd_Common_LIBS := seqDev seq pv $(18IDd_Common_LIBS)
	else
		# seq 2.2.
		18IDd_Common_LIBS := seq pv $(18IDd_Common_LIBS)
	endif
endif

ifdef ASYN
	18IDd_Common_DBD += asyn.dbd drvAsynSerialPort.dbd
	18IDd_Common_DBD += drvAsynIPPort.dbd drvVxi11.dbd devGpib.dbd
	18IDd_Common_LIBS := asyn $(18IDd_Common_LIBS)
endif

ifdef STD
	18IDd_Common_DBD += stdSupport.dbd
	18IDd_Common_LIBS := std $(18IDd_Common_LIBS)
endif

ifdef CALC
	18IDd_Common_DBD += calcSupport.dbd
	18IDd_Common_LIBS := calc $(18IDd_Common_LIBS)
endif

ifdef BUSY
	18IDd_Common_DBD += busySupport.dbd
	18IDd_Common_LIBS := busy $(18IDd_Common_LIBS)
endif

ifdef SSCAN
	18IDd_Common_DBD += sscanSupport.dbd
	18IDd_Common_LIBS := sscan $(18IDd_Common_LIBS)
	ifdef SNCSEQ
		18IDd_Common_DBD += sscanProgressSupport.dbd
		18IDd_Common_LIBS := scanProgress $(18IDd_Common_LIBS)
	endif
endif

ifdef AUTOSAVE
	18IDd_Common_DBD += asSupport.dbd
	18IDd_Common_LIBS := autosave $(18IDd_Common_LIBS)
endif

ifdef OPTICS
	18IDd_Common_DBD += opticsSupport.dbd
	18IDd_Common_LIBS := optics $(18IDd_Common_LIBS)
endif

ifdef MCA
	18IDd_Common_DBD += mcaSupport.dbd
	18IDd_Common_LIBS := mca $(18IDd_Common_LIBS)
endif

ifdef IP
	18IDd_Common_DBD += ipSupport.dbd
	18IDd_Common_LIBS := ip $(18IDd_Common_LIBS)
endif

ifdef MODBUS
	18IDd_Common_DBD += modbusSupport.dbd
	18IDd_Common_LIBS := modbus $(18IDd_Common_LIBS)
endif

ifdef MOTOR
	18IDd_Common_DBD += motorSupport.dbd devAcsMotor.dbd devAerotech.dbd
	18IDd_Common_DBD += devAttocube.dbd devFaulhaberMotor.dbd devImsMotor.dbd
	18IDd_Common_DBD += devKohzuMotor.dbd devMclennanMotor.dbd devMicos.dbd
	18IDd_Common_DBD += devMicroMo.dbd devNewFocus.dbd devNewport.dbd
	18IDd_Common_DBD += devOriel.dbd devPC6K.dbd devPIJena.dbd devPIMotor.dbd
	18IDd_Common_DBD += devSPiiPlus.dbd devSmartMotorMotor.dbd devSoftMotor.dbd
	18IDd_Common_DBD += devThorLabs.dbd motorSimSupport.dbd

	18IDd_Common_LIBS := motor $(18IDd_Common_LIBS)
	18IDd_Common_LIBS := Acs acsTech80 Aerotech Attocube Faulhaber Ims KohzuMotor $(18IDd_Common_LIBS)
	18IDd_Common_LIBS := Mclennan Micos MicroMo NewFocus Newport Oriel PI PIJena $(18IDd_Common_LIBS)
	18IDd_Common_LIBS := Parker SmartMotor ThorLabs softMotor motorSimSupport $(18IDd_Common_LIBS)
endif

ifdef STREAM
	18IDd_Common_DBD += stream.dbd streamSynApps.dbd
	18IDd_Common_LIBS := stream streamSynApps $(18IDd_Common_LIBS)
endif

ifdef DEVIOCSTATS
  ifneq ($(OS_CLASS), WIN32)
	18IDd_Common_DBD += devIocStats.dbd iocAdmin.dbd
	18IDd_Common_LIBS := devIocStats $(18IDd_Common_LIBS)
  endif
endif

ifdef ETHERIP
	18IDd_Common_DBD += ether_ip.dbd
	18IDd_Common_LIBS := ether_ip $(18IDd_Common_LIBS)
endif

ifdef ALIVE
	18IDd_Common_DBD += aliveSupport.dbd
	18IDd_Common_LIBS := alive $(18IDd_Common_LIBS)
endif

ifdef DELAYGEN
	18IDd_Common_DBD += delaygenSupport.dbd
	18IDd_Common_LIBS := delaygen $(18IDd_Common_LIBS)
endif

ifdef VAC
	18IDd_Common_DBD += vacSupport.dbd
	18IDd_Common_LIBS := vac $(18IDd_Common_LIBS)
endif

18IDd_Common_LIBS := $(18IDd_Common_LIBS) $(EPICS_BASE_IOC_LIBS)

##################################################################


ifeq (win32-x86,$(findstring win32-x86, $(T_A)))

	DBD  += ioc18IDdWin32.dbd
	ioc18IDdWin32_DBD += 18IDd_Common.dbd

	ifdef MCA
		# If your host supports libpcap and libnet and you want to build
		# Canberra network support uncomment the following lines
		#ioc18IDdWin32_DBD += mcaCanberraSupport.dbd
		#18IDd_LIBS_WIN32 += mcaCanberra
		#18IDd_LIBS_WIN32 += wpcap Packet
	endif

	ifdef DXP
		# If you want to build parallel port or USB interfaces to Saturn and/or
		# xMAP DXP, then uncomment the following lines
		ioc18IDdWin32_DBD += dxpSupport.dbd
		18IDd_LIBS_WIN32 += dxp handel
		18IDd_LIBS_WIN32 += DLPORTIO PlxApi
		18IDd_SYS_LIBS_WIN32 += setupapi
	endif

endif

ifeq (windows-x64,$(findstring windows-x64, $(T_A)))
	DBD  += ioc18IDdWin64.dbd
	ioc18IDdWin64_DBD += 18IDd_Common.dbd

	ifdef MCA
		# If your host supports libpcap and libnet and you want to build Canberra network
		# support uncomment the following line
		ioc18IDdWin64_DBD += mcaCanberraSupport.dbd
		18IDd_LIBS_WIN32 += mcaCanberra
		18IDd_LIBS_WIN32 += wpcap Packet
	endif

endif

ifeq ($(EPICS_HOST_ARCH), cygwin-x86)
	DBD  += ioc18IDdCygwin.dbd
	ioc18IDdCygwin_DBD += 18IDd_Common.dbd

	ifdef DXP
		# If you want to build parallel port or USB interfaces to Saturn and/or
		# xMAP DXP,then uncomment the following lines
		#ioc18IDdCygwin_DBD += dxpSupport.dbd
		#18IDd_LIBS_cygwin32 += dxp handel
		#18IDd_SYS_LIBS_cygwin32 += DLPORTIO PlxApi setupapi
	endif

	18IDd_SYS_LIBS_cygwin32 += $(CYGWIN_RPC_LIB)

endif

ifeq (vxWorks,$(findstring vxWorks, $(T_A)))
	DBD  += ioc18IDdVX.dbd
	ioc18IDdVX_DBD += 18IDd_Common.dbd

	ifdef ALLEN_BRADLEY
		18IDd_LIBS_vxWorks += allenBradley
	endif

	ifdef QUADEM
		ioc18IDdVX_DBD += drvAHxxx.dbd
		ioc18IDdVX_DBD += drvAPS_EM.dbd
		18IDd_LIBS_vxWorks += quadEM
	endif

	ifdef AREA_DETECTOR
		# areaDetector provides a Makefile for things it needs and supplies
		PROD_NAME = AD
		-include $(ADCORE)/ADApp/commonDriverMakefile
		ioc18IDdVX_DBD += ADSupport.dbd NDPluginSupport.dbd
		18IDd_LIBS_vxWorks += $(AD_LIBS)
		# To add the simDetector uncomment the following lines
		ioc18IDdVX_DBD += simDetectorSupport.dbd
		18IDd_LIBS_vxWorks += simDetector
	endif

	ifdef VME
		ioc18IDdVX_DBD += vmeVXSupport.dbd
		18IDd_LIBS_vxWorks += vme
	endif

	ifdef STD
		ioc18IDdVX_DBD += stdVXSupport.dbd
	endif

	ifdef IP
		ioc18IDdVX_DBD += ipVXSupport.dbd
	endif

	ifdef MCA
		ioc18IDdVX_DBD += SIS38XXSupport.dbd
		ioc18IDdVX_DBD += mcaCanberraSupport.dbd
		18IDd_LIBS_vxWorks += SIS38XX
		18IDd_LIBS_vxWorks += mcaCanberra
	endif

	ifdef IPUNIDIG
		ioc18IDdVX_DBD += ipUnidigSupport.dbd
		18IDd_LIBS_vxWorks += ipUnidig
	endif

	ifdef DAC128V
		ioc18IDdVX_DBD += dac128VSupport.dbd
		18IDd_LIBS_vxWorks += dac128V
	endif

	ifdef IP330
		ioc18IDdVX_DBD += ip330Support.dbd
		18IDd_LIBS_vxWorks += ip330
	endif

	ifdef CAMAC
		ioc18IDdVX_DBD += camacSupport.dbd
		ioc18IDdVX_DBD += devCamacSupport.dbd
		18IDd_LIBS_vxWorks += camac devCamac
	endif

	ifdef ALLEN_BRADLEY
		ioc18IDdVX_DBD += allenBradley.dbd
	endif

	ifdef LOVE
		ioc18IDdVX_DBD += devLove.dbd
		18IDd_LIBS_vxWorks += love
	endif

	ifdef IPAC
		ioc18IDdVX_DBD += tyGSOctal.dbd
		ioc18IDdVX_DBD += drvIpac.dbd
		18IDd_LIBS_vxWorks += TyGSOctal Ipac
	endif

	ifdef ASYN
		ioc18IDdVX_DBD += drvGsIP488.dbd
	endif

	ifdef SOFTGLUE
		ioc18IDdVX_DBD += softGlueSupport.dbd
		18IDd_LIBS_vxWorks += softGlue
	endif

	ifdef MOTOR
		ioc18IDdVX_DBD += devDeltaTau.dbd
		ioc18IDdVX_DBD += devOms.dbd
		18IDd_LIBS_vxWorks += oms DeltaTau
	endif

	ifdef DEVIOCSTATS
		ioc18IDdVX_DBD += devVxStats.dbd
	endif
endif

ifneq (,$(findstring linux, $(T_A)))
	DBD  += ioc18IDdLinux.dbd
	ioc18IDdLinux_DBD += 18IDd_Common.dbd

ifeq ($(HAVE_HDF5), YES)
ifeq ($(HAVE_SZIP), YES)

	ifdef QUADEM
		ioc18IDdLinux_DBD += drvAHxxx.dbd
		18IDd_LIBS_Linux += quadEM
	endif

	ifdef AREA_DETECTOR
		# areaDetector provides a Makefile for things it needs and supplies
		PROD_NAME = AD
		-include $(ADCORE)/ADApp/commonDriverMakefile
		ioc18IDdLinux_DBD += ADSupport.dbd NDPluginSupport.dbd
		18IDd_LIBS_Linux += $(AD_LIBS)
		# To add the simDetector uncomment the following lines
		ioc18IDdLinux_DBD += simDetectorSupport.dbd
		18IDd_LIBS_Linux += simDetector
	endif

	ifdef DXP
		# If your host supports parallel port or USB interfaces to Saturn DXP, set
		# LINUX_USB_INSTALLED to YES in <synApps>/configure/CONFIG_SITE.
		ifeq ($(LINUX_USB_INSTALLED), YES)
			ioc18IDdLinux_DBD += dxpSupport.dbd
			18IDd_LIBS_Linux  += dxp handel
			18IDd_SYS_LIBS_Linux += usb
		endif
	endif

endif
endif

	ifdef MCA
		# If your host supports libpcap and libnet and you want to build Canberra network
		# support, set LINUX_NET_INSTALLED to YES in <synApps>/configure/CONFIG_SITE.
		ifeq ($(LINUX_NET_INSTALLED), YES)
			ioc18IDdLinux_DBD += mcaCanberraSupport.dbd
			18IDd_LIBS_Linux += mcaCanberra
			18IDd_SYS_LIBS_Linux += net pcap
		endif
	endif

	ifdef IPAC
		ioc18IDdLinux_DBD += drvIpac.dbd
		18IDd_LIBS_Linux += Ipac
	endif

	ifdef SOFTGLUE
		ioc18IDdLinux_DBD += softGlueSupport.dbd
		18IDd_LIBS_Linux += softGlue
	endif
endif

ifeq ($(OS_CLASS), Darwin)
	DBD  += ioc18IDdDarwin.dbd
	ioc18IDdDarwin_DBD += 18IDd_Common.dbd
endif



# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
18IDd_SRCS_vxWorks  += ioc18IDdVX_registerRecordDeviceDriver.cpp
18IDd_SRCS_Linux    += ioc18IDdLinux_registerRecordDeviceDriver.cpp     18IDdMain.cpp
ifeq (win32-x86,$(findstring win32-x86, $(T_A)))
	18IDd_SRCS_WIN32    += ioc18IDdWin32_registerRecordDeviceDriver.cpp     18IDdMain.cpp
endif
ifeq (windows-x64,$(findstring windows-x64, $(T_A)))
	18IDd_SRCS_WIN32    += ioc18IDdWin64_registerRecordDeviceDriver.cpp     18IDdMain.cpp
endif
18IDd_SRCS_cygwin32 += ioc18IDdCygwin_registerRecordDeviceDriver.cpp    18IDdMain.cpp
18IDd_SRCS_solaris  += ioc18IDd_solaris_registerRecordDeviceDriver.cpp  18IDdMain.cpp
18IDd_SRCS_Darwin   += ioc18IDdDarwin_registerRecordDeviceDriver.cpp    18IDdMain.cpp



#The following adds support from base/src/vxWorks
18IDd_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

18IDd_LIBS_vxWorks  += $(18IDd_Common_LIBS)
18IDd_LIBS_Linux    += $(18IDd_Common_LIBS)
18IDd_LIBS_solaris  += $(18IDd_Common_LIBS)
18IDd_LIBS_cygwin32 += $(18IDd_Common_LIBS)
18IDd_LIBS_WIN32    += $(18IDd_Common_LIBS)
18IDd_LIBS_Darwin   += $(18IDd_Common_LIBS)


#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

$(COMMON_DIR)/ioc18IDdWin32Include.dbd: $(COMMON_DIR)/18IDd_Common.dbd
$(COMMON_DIR)/ioc18IDdWin64Include.dbd: $(COMMON_DIR)/18IDd_Common.dbd
$(COMMON_DIR)/ioc18IDdCygwinInclude.dbd: $(COMMON_DIR)/18IDd_Common.dbd
$(COMMON_DIR)/ioc18IDdVXInclude.dbd: $(COMMON_DIR)/18IDd_Common.dbd
$(COMMON_DIR)/ioc18IDdLinuxInclude.dbd: $(COMMON_DIR)/18IDd_Common.dbd
$(COMMON_DIR)/ioc18IDdDarwinInclude.dbd: $(COMMON_DIR)/18IDd_Common.dbd

$(COMMON_DIR)/ioc18IDdWin32.dbd: $(COMMON_DIR)/18IDd_Common.dbd
$(COMMON_DIR)/ioc18IDdWin64.dbd: $(COMMON_DIR)/18IDd_Common.dbd
$(COMMON_DIR)/ioc18IDdCygwin.dbd: $(COMMON_DIR)/18IDd_Common.dbd
$(COMMON_DIR)/ioc18IDdVX.dbd: $(COMMON_DIR)/18IDd_Common.dbd
$(COMMON_DIR)/ioc18IDdLinux.dbd: $(COMMON_DIR)/18IDd_Common.dbd
$(COMMON_DIR)/ioc18IDdDarwin.dbd: $(COMMON_DIR)/18IDd_Common.dbd

ioc18IDdWin32.dbd$(DEP): $(COMMON_DIR)/18IDd_Common.dbd
ioc18IDdWin64.dbd$(DEP): $(COMMON_DIR)/18IDd_Common.dbd
ioc18IDdCygwin.dbd$(DEP): $(COMMON_DIR)/18IDd_Common.dbd
ioc18IDdVX.dbd$(DEP): $(COMMON_DIR)/18IDd_Common.dbd
ioc18IDdLinux.dbd$(DEP): $(COMMON_DIR)/18IDd_Common.dbd
ioc18IDdDarwin.dbd$(DEP): $(COMMON_DIR)/18IDd_Common.dbd
