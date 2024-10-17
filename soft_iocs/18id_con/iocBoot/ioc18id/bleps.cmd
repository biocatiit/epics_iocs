## Initialize BLEPS EtherIP driver

drvEtherIP_init()
EIP_verbosity(4)
# Use 480 or smaller, like 450
EIP_buffer_limit(480)

## Configure BLEPS host
# 000.00.000.00   ID000     PLC NETWO 00:00:00:00:00:00
# vxWorks Only
# hostAdd("000","000.00.000.00")

## Define BLEPS PLC
drvEtherIP_define_PLC("bleps","164.54.204.15",0)

## Load BLEPS database(s)
dbLoadTemplate("substitutions/bleps.substitutions")


