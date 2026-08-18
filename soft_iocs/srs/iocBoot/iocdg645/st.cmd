#!../../bin/linux-x86_64/srs

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change srs to something else
#- everywhere it appears in this file

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/srs.dbd"
srs_registerRecordDeviceDriver pdbbase

epicsEnvSet("PREFIX",        "18ID:DG645:")

epicsEnvSet("PORT1", "serial1")
epicsEnvSet("INSTANCE1", "asyn_1")

epicsEnvSet("PORT2", "serial2")
epicsEnvSet("INSTANCE2", "asyn_2")

## For IP Asyn support
## DG645
drvAsynIPPortConfigure("$(PORT1)","164.54.204.68:5025",0,0,0)
drvAsynIPPortConfigure("$(PORT2)","164.54.204.131:5025",0,0,0)

## Asyn record support for serial port
dbLoadRecords("$(ASYN)/db/asynRecord.db","P=$(PREFIX),R=$(INSTANCE1),PORT=$(PORT1),ADDR=0,OMAX=0,IMAX=256")
dbLoadRecords("$(ASYN)/db/asynRecord.db","P=$(PREFIX),R=$(INSTANCE2),PORT=$(PORT2),ADDR=0,OMAX=0,IMAX=256")

#-------------------------

## Device specific configuration
iocshLoad("dg645.iocsh", "PORT=$(PORT1),P=$(PREFIX),R=1:")
iocshLoad("dg645.iocsh", "PORT=$(PORT2),P=$(PREFIX),R=2:")

< save_restore.cmd

iocInit

create_monitor_set("auto_settings.req",30,"P1=$(PREFIX),R1=1:,P2=$(PREFIX),R2=2:")

date
