#
# LabJack_T4_3.cmd
#

### Configure this file for the LabJack unit.  Set the following at a minimum.
###    1.) LabJack unit number
###    2.) EPICS prefix
###    3.) LabJack unit IP number
###    4.) Channel configuration*

### * This file and related support files are all set up for the following
###   default channel configuration:
###
### Analog Inputs (8 ch) :  AIN0-3, FIO4-7
### Digital Inputs (8ch) :  EIO0-7
### Digital Outputs (4ch):  CIO0-3
### Analog Outputs (2ch) :  DAC0-1
###
### NOTE: Other configurations are possible by commenting in/out lines in
###       this file and the .substitutions file.  Database and displays will
###       also need to be modified accordingly.  See in-line comments and
###       https://labjack.com/support/datasheets/t-series for channel options.

# 1.) LabJack unit number n.  Will need a corresponding LabJack_T4_n.substitutions file.
# epicsEnvSet N n
epicsEnvSet N 3

# 2.) Prefix
# epicsEnvSet P prefix:
epicsEnvSet P 18ID:

# Use the following commands for TCP/IP
#drvAsynIPPortConfigure(const char *portName,
#                       const char *hostInfo,
#                       unsigned int priority,
#                       int noAutoConnect,
#                       int noProcessEos);
#
# 3.) LabJack unit (N) IP address
drvAsynIPPortConfigure("LJT4_$(N)","164.54.204.83:502",0,0,1)

#modbusInterposeConfig(const char *portName,
#                      modbusLinkType linkType,
#                      int timeoutMsec,
#                      int writeDelayMsec)
#
modbusInterposeConfig("LJT4_$(N)",0,2000,0)

# 4.) Channel configuration, Modbus setup
#     First 4 channels are dedicated Analog Inputs: (AIN0 - AIN3)
#     The next 8 channels may be AI, DI, or DO:     (FIO4-FIO7, EIO0-EIO3)
#     The last 8 channels may be DI or DO:          (EIO4-EIO7, CIO0-CIO3)
#
###
### DIGITAL INPUTS
###
#
# Word access at Modbus address 0
# Access 1 words as inputs.
# Modbus standard functions 3 (Read Multiple), 4 (Read One), 6 (Write One), and 16 (Write Multiple).
# default data type unsigned integer.
# drvModbusAsynConfigure("portName", "tcpPortName", slaveAddress, modbusFunction, modbusStartAddress, modbusLength, dataType, pollMsec, "plcType")
#
# Read digital inputs one register at a time.
# The next 8 channels may be configured for AI, DI, or DO.  Uncomment these, per channel.
# The corresponding AI and DO channel must be commented out.
drvModbusAsynConfigure("LJT4_$(N)_FIO4_In_Word", "LJT4_$(N)", 1, 3, 2004,  01, 0, 100, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_FIO5_In_Word", "LJT4_$(N)", 1, 3, 2005,  01, 0, 100, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_FIO6_In_Word", "LJT4_$(N)", 1, 3, 2006,  01, 0, 100, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_FIO7_In_Word", "LJT4_$(N)", 1, 3, 2007,  01, 0, 100, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_EIO0_In_Word", "LJT4_$(N)", 1, 3, 2008,  01, 0, 100, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_EIO1_In_Word", "LJT4_$(N)", 1, 3, 2009,  01, 0, 100, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_EIO2_In_Word", "LJT4_$(N)", 1, 3, 2010,  01, 0, 100, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_EIO3_In_Word", "LJT4_$(N)", 1, 3, 2011,  01, 0, 100, "LJT4_module")
#
# These 8 channels are dedicated digital I/O.  The following lines set them up as DI.
# If a channel is uncommented, comment out the corresponding DO channel.
drvModbusAsynConfigure("LJT4_$(N)_EIO4_In_Word", "LJT4_$(N)", 1, 3, 2012,  01, 0, 100, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_EIO5_In_Word", "LJT4_$(N)", 1, 3, 2013,  01, 0, 100, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_EIO6_In_Word", "LJT4_$(N)", 1, 3, 2014,  01, 0, 100, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_EIO7_In_Word", "LJT4_$(N)", 1, 3, 2015,  01, 0, 100, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_CIO0_In_Word", "LJT4_$(N)", 1, 3, 2016,  01, 0, 100, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_CIO1_In_Word", "LJT4_$(N)", 1, 3, 2017,  01, 0, 100, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_CIO2_In_Word", "LJT4_$(N)", 1, 3, 2018,  01, 0, 100, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_CIO3_In_Word", "LJT4_$(N)", 1, 3, 2019,  01, 0, 100, "LJT4_module")

###
### ANALOG INPUTS
###
#
# Read the first 4 analog inputs.  AIN0-AIN3 are dedicated ±10 volt inputs.
drvModbusAsynConfigure("LJT4_$(N)_AI_3In", "LJT4_$(N)", 1, 3, 0,  8, 0, 100, "LJT4_module")

###
### ANALOG OUTPUTS
###
#
# Set 2 analog outputs.
drvModbusAsynConfigure("LJT4_$(N)_AO_0", "LJT4_$(N)", 0, 16, 1000,  2, 8, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_AO_1", "LJT4_$(N)", 0, 16, 1002,  2, 8, 1, "LJT4_module")

###
### EPICS DATABASES, must correspond to AI, DI and DO channels set above.
###
#
# Prefixes in this file must match $(P) set above
dbLoadTemplate("substitutions/LabJack_T4_$(N).substitutions")

# Digital Inputs
#dbLoadRecords("$(LABJACK)/LabJackApp/Db/LabJack_T4_di.db", "P=$(P)LJT4:$(N):")


