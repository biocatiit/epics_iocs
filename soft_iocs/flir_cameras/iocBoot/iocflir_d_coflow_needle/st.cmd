#!../../bin/linux-x86_64/flir_cameras

< envPaths
errlogInit(20000)

dbLoadDatabase("$(TOP)/dbd/flir_cameras.dbd")
flir_cameras_registerRecordDeviceDriver(pdbbase)

# Use this line for a specific camera by serial number, in this case a FLIR GigE
epicsEnvSet("CAMERA_ID", "25243599")
#epicsEnvSet("CAMERA_ID", "0")

epicsEnvSet("GENICAM_DB_FILE", "$(ADGENICAM)/db/PGR_Blackfly_23S6C.template")

< st.cmd.base

