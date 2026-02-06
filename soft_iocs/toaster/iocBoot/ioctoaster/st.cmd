#!../../bin/linux-x86_64/toaster

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change toaster to something else
#- everywhere it appears in this file

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/toaster.dbd"
toaster_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("toast.db", "P=18ID:,D=H:,MOTOR=18ID_DMC_E05:33")
dbLoadRecords("toast2.db", "P=18ID:,D=H:,MOTOR=18ID_DMC_E05:33")
dbLoadRecords("toast2.db", "P=18ID:,D=V:,MOTOR=18ID_DMC_E05:34")

iocInit

## Start any sequence programs
#seq sncxxx,"user=biocat"
