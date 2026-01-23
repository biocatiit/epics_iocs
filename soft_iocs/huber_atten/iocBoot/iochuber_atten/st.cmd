#!../../bin/linux-x86_64/huber_atten

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change huber_atten to something else
#- everywhere it appears in this file

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/huber_atten.dbd"
huber_atten_registerRecordDeviceDriver pdbbase


# Use the following commands for TCP/IP
#drvAsynIPPortConfigure(const char *portName,
#                       const char *hostInfo,
#                       unsigned int priority,
#                       int noAutoConnect,
#                       int noProcessEos);
drvAsynIPPortConfigure("Huber1","164.54.204.27:502",0,0,0)
asynSetOption("Huber1",0, "disconnectOnReadTimeout", "Y")

#modbusInterposeConfig(const char *portName,
#                      modbusLinkType linkType,
#                      int timeoutMsec,
#                      int writeDelayMsec)
modbusInterposeConfig("Huber1",0,5000,0)


# Word access at Modbus address 0
# Access 1 words as inputs.  
# Modbus standard functions 3 (Read Multiple), 4 (Read One), 6 (Write One), and 16 (Write Multiple). 
# default data type unsigned integer.
# drvModbusAsynConfigure("portName", 
#		"tcpPortName", 
#		slaveAddress, 
#		modbusFunction, 
#		modbusStartAddress, 
#		modbusLength, 
#		dataType, 
#		pollMsec, 
#		"plcType")

# Attenuator I/Os
drvModbusAsynConfigure("H1_An_In_Word", "Huber1", 0, 3, 0, 01, "UINT16",  100, "Huber")
drvModbusAsynConfigure("H1_An_Out_Word", "Huber1", 0, 6, 0, 01, "UINT16",  100, "Huber")

# Attenuator thicknesses
drvModbusAsynConfigure("H1_T1_In_Word", "Huber1", 0, 3, 9, 01, "UINT16",  5000, "Huber")
drvModbusAsynConfigure("H1_T2_In_Word", "Huber1", 0, 3, 10, 01, "UINT16",  5000, "Huber")
drvModbusAsynConfigure("H1_T3_In_Word", "Huber1", 0, 3, 11, 01, "UINT16",  5000, "Huber")
drvModbusAsynConfigure("H1_T4_In_Word", "Huber1", 0, 3, 12, 01, "UINT16",  5000, "Huber")
drvModbusAsynConfigure("H1_T5_In_Word", "Huber1", 0, 3, 13, 01, "UINT16",  5000, "Huber")
drvModbusAsynConfigure("H1_T6_In_Word", "Huber1", 0, 3, 14, 01, "UINT16",  5000, "Huber")
drvModbusAsynConfigure("H1_T7_In_Word", "Huber1", 0, 3, 15, 01, "UINT16",  5000, "Huber")
drvModbusAsynConfigure("H1_T8_In_Word", "Huber1", 0, 3, 16, 01, "UINT16",  5000, "Huber")

# Attenuator labels (first 4 characters)
drvModbusAsynConfigure("H1_L1_In_Word", "Huber1", 0, 3, 19, 05, "ZSTRING_LOW",  5000, "Huber")
drvModbusAsynConfigure("H1_L2_In_Word", "Huber1", 0, 3, 24, 05, "ZSTRING_LOW",  5000, "Huber")
drvModbusAsynConfigure("H1_L3_In_Word", "Huber1", 0, 3, 29, 05, "ZSTRING_LOW",  5000, "Huber")
drvModbusAsynConfigure("H1_L4_In_Word", "Huber1", 0, 3, 34, 05, "ZSTRING_LOW",  5000, "Huber")
drvModbusAsynConfigure("H1_L5_In_Word", "Huber1", 0, 3, 39, 05, "ZSTRING_LOW",  5000, "Huber")
drvModbusAsynConfigure("H1_L6_In_Word", "Huber1", 0, 3, 44, 05, "ZSTRING_LOW",  5000, "Huber")
drvModbusAsynConfigure("H1_L7_In_Word", "Huber1", 0, 3, 49, 05, "ZSTRING_LOW",  5000, "Huber")
drvModbusAsynConfigure("H1_L8_In_Word", "Huber1", 0, 3, 54, 05, "ZSTRING_LOW",  5000, "Huber")

dbLoadTemplate("Huber1.substitutions")

iocInit

date


