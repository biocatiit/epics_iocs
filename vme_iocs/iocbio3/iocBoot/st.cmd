# vxWorks startup script to load and execute system (iocCore) software.
# from an mv167
############################# FOR iocbio3 ##########################
########################### booting from id4 #######################

### Set the default gateway (the address to which IP datagrams will be sent
# when there is no specific routing table entry available for the actual
# destination address.):
# routeAdd "164.54.204.0","164.54.204.1"
# Change of 07.15.97:
  routeAdd "0","164.54.204.1"
# routeShow

### The following lines are required to use NFS, rather than FTP, for
# booting the VME crate, and generally for reading and writing files
# on the server:
# hostAdd("id1", "164.54.204.2")
# This host is commented because it is already set in the boot setup:
# hostAdd("id2", "164.54.204.5")
# hostAdd("id4", "164.54.204.60")
  hostShow
# nfsMount("id4", "/home/bionew", "/home/bionew")
# nfsMount("id4", "/usr/local", "/usr/local")

### Give vw5 (uid 106, gid 14) permission to write NFS files on id1:
# nfsAuthUnixSet("id1", 106, 14, 0)
# nfsAuthUnixSet("id2", 106, 14, 0)
# nfsAuthUnixSet("id4", 516, 500, 0)

  cd "/opt/epics/R3.12.2.patch7/base/bin/mv167"

### Load EPICS base software epics code:
# The following should be loaded first - BEGIN
  ld < iocCore
  ld < drvSup
  ld < devSup
  ld < recSup
  ld < seq
# The first should be loaded first - END

# cd "/home/biocat/top"
# cd "/home/bionew/top"
  cd "/opt/epics/R3.12.2.patch7/"

### Load custom EPICS software (from xfdApp, etc):
# Most of XFD custom records and device support:
  ld < stdApp/src/O.mv167/stdlib.o
# ld < supApp/src/O.mv167/supportLib.o

### Load initHooks: currently, the only thing XFD does in initHooks is call
# reboot_restore(), which restores positions and settings saved ~continuously
# while EPICS is alive. See calls to "create_monitor_set()" at the end of
# this file.  To disable autorestore, comment out the following line:
# ld < stdApp/src/O.mv167/initHooks.o

### Load multichannel analyzer stuff:
# ld < mcaApp/src/O.mv167/mcalib.o
# ld < mcaApp/src/O.mv167/icbAdcSub.o

### Interactive GPIB: type GI at vxWorks prompt to use this
# ld < ./base/bin/mv167/devGpibInteract.o

### Override address, interrupt vector, etc. information in module_types.h
# XFD needs to do this because device-support software they're inheriting from
# EPICS base wants to use some of the address space they need for their stuff.
# module_types()

# Need more entries in Wait-record channel-access queue
# recDynLinkQsize = 1024

### Load PMAC support library:
  ld < pmacApp/src/O.mv167/pmacLib.o
  ld < mtrApp/src/O.mv167/mtrLib.o

############################################################
### Define record types, load databases here (binary file):#
  cd "/opt/epics/R3.12.2.patch7/iocApp/iocbio3"
  dbLoad "default.dctsdr"
############################################################

################################
# Download PMAC database:      #
# cd "ioc/iocbio3"
  < st.pmac
  cd "../.."
################################

################################
# Download XFD database:       #
# < ioc/iocbio3/st.xfd
################################
# dbLoadRecords("/home/bionew/top/testApp/testDb/testcalc.db")


# I don't know why IOC tries to connect to phoebus.aps.anl.gov
# (164.54.8.167). This comment removes the problem:
  iocLogDisable =1
  errToLogMsg =0

# Add user biocat
# Before July-2001:
# loginUserAdd "biocat", "cQzQRbbScz"
# After July-2001:
# loginUserAdd "biocat", "ReSzQSydQb"

# Added 08/01/97:
  cd "/home/ioc/iocbio3"

# Initialize IOC:
  iocInit
# cd "/home/bionew/top/testApp/testDb"
############################# END iocbio3 ##########################
# Disable the FTP service (task stop):
# i
  ts tFtpdTask
  shellPromptSet "iocbio3>"
#Sergey suggestion to restart clocks automagically.  2004 01 30

  dbpf ("18ID:pmac30:StrCmd","gather")
  dbpf ("18ID:pmac31:StrCmd","gather")
  dbpf ("18ID:pmac32:StrCmd","gather")

  dbpf ("18ID:pmac30:StrCmd","i55=1")
  dbpf ("18ID:pmac31:StrCmd","i55=1")
  dbpf ("18ID:pmac32:StrCmd","i55=1")

