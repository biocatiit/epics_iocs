#!/bin/bash -i
pushd /opt/epics/epics_iocs/soft_iocs/galil_DMC_E05/iocBoot/iocgalil_DMC_E05
./ioc_start.sh $1
popd
