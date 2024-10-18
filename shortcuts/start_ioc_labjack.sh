#!/bin/bash -i
pushd /opt/epics/epics_iocs/soft_iocs/labjack/iocBoot/ioclabjack
./ioc_start.sh $1
popd
