#!../../bin/linux-x86_64/srs

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change srs to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet("PREFIX",        "18ID:SR570:")

epicsEnvSet("PREFIX1",        "18ID:SR570:1:")
epicsEnvSet("PORT1", "serial1")
epicsEnvSet("INSTANCE1", "asyn_1")

epicsEnvSet("PREFIX2",        "18ID:SR570:2:")
epicsEnvSet("PORT2", "serial2")
epicsEnvSet("INSTANCE2", "asyn_2")

epicsEnvSet("PREFIX3",        "18ID:SR570:3:")
epicsEnvSet("PORT3", "serial3")
epicsEnvSet("INSTANCE3", "asyn_3")

epicsEnvSet("PREFIX4",        "18ID:SR570:4:")
epicsEnvSet("PORT4", "serial4")
epicsEnvSet("INSTANCE4", "asyn_4")

## Register all support components
dbLoadDatabase "../../dbd/srs.dbd"
srs_registerRecordDeviceDriver pdbbase

# Set up 4 MOXA Nport serial ports
iocshLoad("$(IP)/iocsh/loadIPPort.iocsh", "PORT=$(PORT1), IP=164.54.204.52:4001, INSTANCE=$(INSTANCE1)")
iocshLoad("$(IP)/iocsh/loadIPPort.iocsh", "PORT=$(PORT2), IP=164.54.204.52:4002, INSTANCE=$(INSTANCE2)")
iocshLoad("$(IP)/iocsh/loadIPPort.iocsh", "PORT=$(PORT3), IP=164.54.204.52:4003, INSTANCE=$(INSTANCE3)")
iocshLoad("$(IP)/iocsh/loadIPPort.iocsh", "PORT=$(PORT4), IP=164.54.204.52:4004, INSTANCE=$(INSTANCE4)")

# Stanford Research Systems SR570 Current Preamplifier
iocshLoad("./SR_570.iocsh", "PREFIX=$(PREFIX1), INSTANCE=$(INSTANCE1), PORT=$(PORT1)")
iocshLoad("./SR_570.iocsh", "PREFIX=$(PREFIX2), INSTANCE=$(INSTANCE2), PORT=$(PORT2)")
iocshLoad("./SR_570.iocsh", "PREFIX=$(PREFIX3), INSTANCE=$(INSTANCE3), PORT=$(PORT3)")
iocshLoad("./SR_570.iocsh", "PREFIX=$(PREFIX4), INSTANCE=$(INSTANCE4), PORT=$(PORT4)")

< save_restore.cmd

iocInit

create_monitor_set("auto_settings.req",30,"P1=$(PREFIX1),P2=$(PREFIX2),P3=$(PREFIX3),P4=$(PREFIX4),A1=$(INSTANCE1),A2=$(INSTANCE2),A3=$(INSTANCE3),A4=$(INSTANCE4)")

date

dbpf "18ID:SR570:1:asyn_1init.PROC" 1
dbpf "18ID:SR570:2:asyn_2init.PROC" 1
dbpf "18ID:SR570:3:asyn_3init.PROC" 1
dbpf "18ID:SR570:4:asyn_4init.PROC" 1
