#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/detectors/iocBoot/iocpilatus3
./ioc_start.sh $1
popd
