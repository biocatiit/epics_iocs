#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/meas_comp/iocBoot/iocmeas_comp_e1608
./ioc_start.sh $1
popd
