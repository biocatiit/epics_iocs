#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/meas_comp_etc/iocBoot/iocmeas_comp_etc
./ioc_start.sh $1
popd