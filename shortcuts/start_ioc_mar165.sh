#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/detectors/iocBoot/iocmar165
./ioc_start.sh $1
popd
