#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/detectors/iocBoot/ioceiger2x
./ioc_start.sh $1
popd
