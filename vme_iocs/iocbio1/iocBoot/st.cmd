# vxWorks startup script to load and execute system (iocCore) software.
# from an mv162
############################# FOR iocbio1 ##########################
########################### booting from id4 #######################

### Set the default gateway (the address to which IP datagrams will be sent
# when there is no specific routing table entry available for the actual
# destination address.):
### Syntax: routeAdd "destaddr","gateaddr"
# routeAdd "164.54.204.0","164.54.204.1"
# Change of 07.15.97:
  routeAdd "0","164.54.204.1"
# routeShow

### The following lines are required to use NFS, rather than FTP, for
# booting the VME crate, and generally for reading and writing files
# on the server:
# This host is commented out because it is already set in the boot setup:
# hostAdd("id4", "164.54.204.60")
# hostShow
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
# the first should be loaded first - END

# cd "/home/biocat/top"
# cd "/home/bionew/top"
  cd "/opt/epics/R3.12.2.patch7/"

### Load custom EPICS software (from xfdApp, etc):
# (Most of XFD custom records and device support)
  ld < stdApp/src/O.mv167/stdlib.o
# ld < supApp/src/O.mv167/supportLib.o

### Load PMAC support library:
  ld < pmacApp/src/O.mv167/pmacLib.o
  ld < mtrApp/src/O.mv167/mtrLib.o

### Load EPS support library:
  ld < epsApp/src/O.mv167/epsLib.o

############################################################
### Define record types, load databases here (binary file):#
  cd "/opt/epics/R3.12.2.patch7/iocApp/iocbio1"
  dbLoad "default.dctsdr"
############################################################

################################
# Download PMAC database:      #
# cd "ioc/iocbio1"
  < st.pmac
# cd "../.."
################################

### Load EPS database:
  cd "/opt/epics/R3.12.2.patch7/"
  dbLoadRecords("epsApp/epsDb/epstest.db","eps=18ID:EPS:,id=18ID:")
  
###############################################################################
### Acromag 9440 digital IO records:
### ATTENTION: to use interrupts on inputs 0-7,
### set interrupt level to 5 (jumper J4: 1&2, 5&6 IN))
#  dbLoadTemplate("digital_IO.substitutions")

# devAvme9440Debug=5

### Acromag AVME9440 setup parameters:
### devAvem9440Config (ncards,a16base,intvecbase)
#  devAvme9440Config(1, 0x2800, 0x78)
###############################################################################

  iocLogDisable =1
  errToLogMsg =0

# Add user biocat
# [use: /usr/local/vw/vxV52p1/vw/bin/solaris/vxencrypt]
#loginUserAdd "dgore", "b9dbzddeed"

# IOC Init
  iocInit
############################# END iocbio1 ##########################
# Disable the FTP service (task stop):
# i
  ts tFtpdTask
  shellPromptSet "iocbio1>"
#Sergey suggestion to restart clocks automagically.  2004 01 30

  dbpf ("18ID:pmac10:StrCmd","gather")
  dbpf ("18ID:pmac11:StrCmd","gather")
  dbpf ("18ID:pmac12:StrCmd","gather")

  dbpf ("18ID:pmac10:StrCmd","i55=1")
  dbpf ("18ID:pmac11:StrCmd","i55=1")
  dbpf ("18ID:pmac12:StrCmd","i55=1")

