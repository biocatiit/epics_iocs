#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/galil_DMC/iocBoot/iocgalil_DMC_E04
./ioc_start.sh $1
popd
