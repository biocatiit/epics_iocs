# vxWorks startup script to load and execute system (iocCore) software.
# from an mv162
############################# FOR iocbio2 ##########################
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
# nfsMount("id1", "/home/biocat", "/home/biocat")
# nfsMount("id4", "/home/bionew", "/home/bionew")
# nfsMount("id4", "/usr/local", "/usr/local")

### Give vw5 (uid 106, gid 14) permission to write NFS files on id1 and id2:
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

### Load PMAC support library:
  ld < pmacApp/src/O.mv167/pmacLib.o
  ld < mtrApp/src/O.mv167/mtrLib.o

############################################################
### Define record types, load databases here (binary file):#
  cd "/opt/epics/R3.12.2.patch7/iocApp/iocbio2"
  dbLoad "default.dctsdr"
############################################################

################################
# Download PMAC database:      #
# cd "ioc/iocbio2"
  < st.pmac
# cd "../.."
################################

  iocLogDisable =1
  errToLogMsg =0

## Add user biocat
# [use: /usr/local/vw/vxV52p1/vw/bin/solaris/vxencrypt]
# Before July-2001:
# loginUserAdd "biocat", "cQzQRbbScz"
# After July-2001:
# loginUserAdd "biocat", "ReSzQSydQb"

# Initialize IOC:  2m50s done, 3 min 30 sec to go...
  iocInit
############################# END iocbio2 ##########################
# Disable the FTP service (task stop):
# i
  ts tFtpdTask
  shellPromptSet "iocbio2>"
#Sergey suggestion to restart clocks automagically.  2004 01 30
#
  dbpf ("18ID:pmac20:StrCmd","gather")
  dbpf ("18ID:pmac20:StrCmd","i55=1")
  dbpf ("18ID:pmac21:StrCmd","gather")
  dbpf ("18ID:pmac21:StrCmd","i55=1")
  dbpf ("18ID:pmac22:StrCmd","gather")
  dbpf ("18ID:pmac22:StrCmd","i55=1")

