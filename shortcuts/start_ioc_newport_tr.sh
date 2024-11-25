#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/newport/iocBoot/iocnewport_tr
./ioc_start.sh $1
popd
