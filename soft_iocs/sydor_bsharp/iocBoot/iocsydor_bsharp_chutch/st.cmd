#!../../bin/linux-x86_64/sydor_bsharp
errlogInit(5000)
< envPaths

# Tell EPICS all about the record types, device-support modules, drivers,
# etc. in this build
dbLoadDatabase("../../dbd/sydor_bsharp.dbd")
sydor_bsharp_registerRecordDeviceDriver pdbbase

# The search path for database files
# Note: the separator between the path entries needs to be changed to a semicolon (;) on Windows
epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(ADCORE)/db:$(QUADEM)/db")

< ./NSLS_EM.cmd
