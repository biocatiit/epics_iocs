#
# LabJack_T4_2.cmd
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
epicsEnvSet N 2

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
drvAsynIPPortConfigure("LJT4_$(N)","164.54.204.84:502",0,0,1)

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
### ANALOG INPUTS
###
#
# Read the first 4 analog inputs.  AIN0-AIN3 are dedicated ±10 volt inputs.
drvModbusAsynConfigure("LJT4_$(N)_AI_3In", "LJT4_$(N)", 1, 3, 0,  8, 0, 100, "LJT4_module")

###
### DIGITAL OUTPUTS
###
#
# Access 1 words as outputs.
# Either function code=6 (single register) or 16 (multiple registers) can be used, but 16
# is better because it is "atomic" when writing values longer than 16-bits.
# Default data type unsigned integer.
# drvModbusAsynConfigure("portName", "tcpPortName", slaveAddress, modbusFunction, modbusStartAddress, modbusLength, dataType, pollMsec, "plcType")
#
# These 8 channels may be configured for AI, DI, or DO.  Uncomment these, per channel.
# The corresponding AI and DI channel must be commented out.
drvModbusAsynConfigure("LJT4_$(N)_FIO4_Out_Word", "LJT4_$(N)", 0, 6, 2004, 1, 0, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_FIO5_Out_Word", "LJT4_$(N)", 0, 6, 2005, 1, 0, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_FIO6_Out_Word", "LJT4_$(N)", 0, 6, 2006, 1, 0, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_FIO7_Out_Word", "LJT4_$(N)", 0, 6, 2007, 1, 0, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_EIO0_Out_Word", "LJT4_$(N)", 0, 6, 2008, 1, 0, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_EIO1_Out_Word", "LJT4_$(N)", 0, 6, 2009, 1, 0, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_EIO2_Out_Word", "LJT4_$(N)", 0, 6, 2010, 1, 0, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_EIO3_Out_Word", "LJT4_$(N)", 0, 6, 2011, 1, 0, 1, "LJT4_module")

# These 8 channels are dedicated digital I/O.  The following lines set them up as DO.
# If a channel is uncommented, comment out the corresponding DI channel.
drvModbusAsynConfigure("LJT4_$(N)_EIO4_Out_Word", "LJT4_$(N)", 0, 6, 2012, 1, 0, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_EIO5_Out_Word", "LJT4_$(N)", 0, 6, 2013, 1, 0, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_EIO6_Out_Word", "LJT4_$(N)", 0, 6, 2014, 1, 0, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_EIO7_Out_Word", "LJT4_$(N)", 0, 6, 2015, 1, 0, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_CIO0_Out_Word", "LJT4_$(N)", 0, 6, 2016, 1, 0, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_CIO1_Out_Word", "LJT4_$(N)", 0, 6, 2017, 1, 0, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_CIO2_Out_Word", "LJT4_$(N)", 0, 6, 2018, 1, 0, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_CIO3_Out_Word", "LJT4_$(N)", 0, 6, 2019, 1, 0, 1, "LJT4_module")

###
### ANALOG OUTPUTS
###
#
# Set 2 analog outputs.
drvModbusAsynConfigure("LJT4_$(N)_AO_0", "LJT4_$(N)", 0, 16, 1000,  2, 8, 1, "LJT4_module")
drvModbusAsynConfigure("LJT4_$(N)_AO_1", "LJT4_$(N)", 0, 16, 1002,  2, 8, 1, "LJT4_module")

dbLoadTemplate("substitutions/LabJack_T4_$(N).substitutions")




