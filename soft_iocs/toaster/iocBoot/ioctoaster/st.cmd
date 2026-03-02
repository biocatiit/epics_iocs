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
# Note that the MOTOR value for toast.db is actually most likely being set by the autosave
# So if you change motor here in the database be sure to delete autosave files for this to work
# Or just change it by setting the PV.LNK1 and LNK2 values as usual once the IOC is running
# If you do change it while IOC is running, make sure LNK1 and LNK2 are the same!

# Horizontal motor toaster. 
dbLoadRecords("toast.db", "P=18ID:,D=H:,MOTOR=18ID_DMC_E05:33")

# Vertical motor toaster.
dbLoadRecords("toast.db", "P=18ID:,D=V:,MOTOR=18ID_DMC_E05:34")

# Autosave cmd
< save_restore.cmd

iocInit

# Start autosave
create_monitor_set("auto_settings.req", 30,"P=18ID:")

date
