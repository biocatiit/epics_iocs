#!/bin/bash
pushd /opt/epics/epics_iocs/shortcuts
./start_ioc_meas_comp_usb.sh start
./start_ioc_huber_atten.sh start
./start_ioc_meas_comp_ctr.sh start
./start_ioc_srs570.sh start
popd
