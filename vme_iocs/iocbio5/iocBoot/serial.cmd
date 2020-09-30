
# BEGIN serial.cmd ------------------------------------------------------------

drvAsynIPPortConfigure("ps1","164.54.204.16:2001",0,0,0)
asynOctetSetInputEos("ps1",0,"\r\n")
asynOctetSetOutputEos("ps1",0,"\r")
# Load asynRecord records on all ports
dbLoadTemplate("asynRecord.substitutions","")

dbLoadTemplate("dcMotor.substitutions","")
# Faulhaber MCDC2805 driver setup parameters:
#     (1)Max. controller count
#     (2)Polling rate
MCDC2805Setup(1, 10)

# Faulhaber MCDC2805 driver configuration parameters:
#     (1)Card being configured
#     (2)# modules on this serial port
#     (3)asyn port name
MCDC2805Config(0, 1, "ps1")

# send impromptu message to serial device, parse reply
# (was serial_OI_block)
#dbLoadRecords("$(IP)/ipApp/Db/deviceCmdReply.db","P=18ID:e:,N=1,PORT=serial1,ADDR=0,OMAX=100,IMAX=100")

# END serial.cmd --------------------------------------------------------------
