#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/toaster/iocBoot/ioctoaster
./ioc_start.sh $1
popd
