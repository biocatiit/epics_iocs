#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/meas_comp_e1608/iocBoot/iocmeas_comp_e1608
./ioc_start.sh $1
popd
