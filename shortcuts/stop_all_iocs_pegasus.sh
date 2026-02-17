#!/bin/bash
pushd /opt/epics/epics_iocs/shortcuts
./start_ioc_meas_comp_usb.sh stop
./start_ioc_huber_atten.sh stop
./start_ioc_meas_comp_ctr.sh stop
./start_ioc_srs570.sh stop
popd
