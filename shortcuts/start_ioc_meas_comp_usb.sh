#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/meas_comp/iocBoot/iocmeas_comp_usb
./ioc_start.sh $1
popd
