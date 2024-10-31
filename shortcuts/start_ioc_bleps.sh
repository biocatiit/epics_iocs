#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/bleps/iocBoot/ioc18id
./ioc_start.sh $1
popd
