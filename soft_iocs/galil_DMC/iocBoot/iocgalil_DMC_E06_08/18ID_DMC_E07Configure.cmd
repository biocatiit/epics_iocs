# Configure an example DMC (digital motor controller)

##################################################################################################
# Configuration settings
# Configure these settings for site

## uncomment to see every command sent to galil
#epicsEnvSet("GALIL_DEBUG_FILE", "galil_debug2.txt")

# Asyn port name (eg. DMC01, DMC02, RIO01)
epicsEnvSet("PORT2", "18ID_DMC_E07")

# Controller address (IP address, serial port)
epicsEnvSet("ADDRESS2", "10.10.10.9")

# Controller update period Unit = millisecond
# Range 2-200
epicsEnvSet("UPDPERIOD2", "8")

##################################################################################################
# Derived configuration settings

# Record prefix derived from asyn port name
epicsEnvSet("P2", "$(PORT2):")

##################################################################################################

#Load motor records for real and coordinate system (CS) motors
#Motor record version 6-9 and below
# dbLoadTemplate("$(TOP)/galil_DMCApp/Db/$(PORT2)_motors-v6-9down.substitutions", "P=$(P2), PORT=$(PORT2)")
#Motor record version 6-10 and up
dbLoadTemplate("$(TOP)/galil_DMCApp/Db/$(PORT2)_motors-v6-10up.substitutions", "P=$(P2), PORT=$(PORT2)")

#Load DMC controller features (eg.  Limit switch type, home switch type, output compare, message consoles)
dbLoadTemplate("$(TOP)/galil_DMCApp/Db/galil_dmc_ctrl.substitutions", "P=$(P2), PORT=$(PORT2)")

#Load extra features for real axis/motors (eg. Motor type, encoder type)
dbLoadTemplate("$(TOP)/galil_DMCApp/Db/$(PORT2)_motor_extras.substitutions", "P=$(P2), PORT=$(PORT2)")

#Load extra features for CS axis/motors (eg. Setpoint monitor)
dbLoadTemplate("$(TOP)/galil_DMCApp/Db/galil_csmotor_extras.substitutions", "P=$(P2), PORT=$(PORT2)")

#Load kinematics for CS axis/motors (eg. Forward and reverse kinematics, kinematic variables)
dbLoadTemplate("$(TOP)/galil_DMCApp/Db/galil_csmotor_kinematics.substitutions", "P=$(P2), PORT=$(PORT2)")

#Load coordinate system features (eg. Coordinate system S and T status, motor list, segments processed, moving status)
dbLoadTemplate("$(TOP)/galil_DMCApp/Db/galil_coordinate_systems.substitutions", "P=$(P2), PORT=$(PORT2)")

#Load digital IO databases
dbLoadTemplate("$(TOP)/galil_DMCApp/Db/galil_dmc_digital_ports.substitutions", "P=$(P2), PORT=$(PORT2)")

#Load analog IO databases
dbLoadTemplate("$(TOP)/galil_DMCApp/Db/galil_dmc_analog_ports.substitutions", "P=$(P2), PORT=$(PORT2)")

#Load user defined functions
dbLoadTemplate("$(TOP)/galil_DMCApp/Db/galil_userdef_records.substitutions", "PORT=$(PORT2)")

#Load user defined array support
dbLoadTemplate("$(TOP)/galil_DMCApp/Db/galil_user_array.substitutions", "P=$(P2), PORT=$(PORT2)")

#Load profiles
dbLoadTemplate("$(TOP)/galil_DMCApp/Db/$(PORT2)_profileMoveController.substitutions", "P=$(P2), PORT=$(PORT2)")
dbLoadTemplate("$(TOP)/galil_DMCApp/Db/$(PORT2)_profileMoveAxis.substitutions", "P=$(P2), PORT=$(PORT2)")

# GalilCreateController command parameters are:
#
# 1. Const char *portName   - The name of the asyn port that will be created for this controller
# 2. Const char *address    - The address of the controller
# 3. double updatePeriod    - The time in ms between datarecords 2ms min, 200ms max.  Async if controller + bus supports it, otherwise is polled/synchronous.
#                           - Recommend 50ms or less for ethernet
#                           - Specify negative updatePeriod < 0 to force synchronous tcp poll period.  Otherwise will try async udp mode first

# Create a Galil controller
GalilCreateController("$(PORT2)", "$(ADDRESS2)", "$(UPDPERIOD2)")

# GalilCreateAxis command parameters are:
#
# 1. char *portName Asyn port for controller
# 2. char  axis A-H,
# 3. char  *Motor interlock digital port number 1 to 8 eg. "1,2,4".  1st 8 bits are supported
# 4. int   Interlock switch type 0 active when opto active, all other values switch type active when opto inactive

# Create the axis
GalilCreateAxis("$(PORT2)","A","",1)
GalilCreateAxis("$(PORT2)","B","",1)
GalilCreateAxis("$(PORT2)","C","",1)
GalilCreateAxis("$(PORT2)","D","",1)
GalilCreateAxis("$(PORT2)","E","",1)
GalilCreateAxis("$(PORT2)","F","",1)
GalilCreateAxis("$(PORT2)","G","",1)
GalilCreateAxis("$(PORT2)","H","",1)

# GalilAddCode command parameters are:
# Add custom code to generated code
# 1. char *portName Asyn port for controller
# 2. int section = code section to add custom code into 0 = card code, 1 = thread code, 2 = limits code, 3 = digital code
# 3. char *code_file custom code file
# GalilAddCode("$(PORT2)", 1, "customcode.dmc")

# GalilReplaceHomeCode command parameters are:
# Replace generated axis home code with custom code
# 1. char *portName Asyn port for controller
# 2. char *Axis A-H
# 3. char *code_file custom code file
# GalilReplaceHomeCode("$(PORT2)", "A", "homeA.dmc")

# GalilCreateCSAxes command parameters are:
#
# 1. char *portName Asyn port for controller

#Create all CS axes (ie. I-P axis)
GalilCreateCSAxes("$(PORT2)")

# GalilStartController command parameters are:
#
# 1. char *portName Asyn port for controller
# 2. char *code file(s) to deliver to the controller we are starting. "" = use generated code (recommended)
#             Specify a single file or to use templates use: headerfile;bodyfile1!bodyfile2!bodyfileN;footerfile
# 3. int   Burn program to EEPROM conditions
#             0 = transfer code if differs from eeprom, dont burn code to eeprom, then finally execute code thread 0
#             1 = transfer code if differs from eeprom, burn code to eeprom, then finally execute code thread 0
#             It is asssumed thread 0 starts all other required threads
# 4. int   Thread mask.  Check these threads are running after controller code start.  Bit 0 = thread 0 and so on
#             if thread mask < 0 nothing is checked
#             if thread mask = 0 and GalilCreateAxis appears > 0 then threads 0 to number of GalilCreateAxis is checked (good when using the generated code)

# Start the controller
GalilStartController("$(PORT2)", "", 1, 0)

# Start the controller
# Example using homing routine template assembly
#GalilStartController("$(PORT2)", "$(GALIL)/GalilSup/Db/galil_Default_Header.dmc;$(GALIL)/GalilSup/Db/galil_Home_RevLimit.dmc!$(GALIL)/GalilSup/Db/galil_Home_ForwLimit.dmc!$(GALIL)/GalilSup/Db/galil_Home_Home.dmc!$(GALIL)/GalilSup/Db/galil_Home_ForwLimit.dmc!$(GALIL)/GalilSup/Db/galil_Piezo_Home.dmc!$(GALIL)/GalilSup/Db/galil_Piezo_Home.dmc!$(GALIL)/GalilSup/Db/galil_Piezo_Home.dmc!$(GALIL)/GalilSup/Db/galil_Piezo_Home.dmc;$(GALIL)/GalilSup/Db/galil_Default_Footer.dmc", 0, 0, 3)

# GalilCreateProfile command parameters are:
#
# 1. char *portName Asyn port for controller
# 2. Int maxPoints in trajectory

# Create trajectory profiles
GalilCreateProfile("$(PORT2)", 2000)

