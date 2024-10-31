#!/bin/bash
pushd /opt/epics/epics_iocs/shortcuts
./start_ioc_bleps.sh stop
./start_ioc_galil_dmc_e03.sh stop
./start_ioc_galil_dmc_e04.sh stop
./start_ioc_galil_dmc_e05.sh stop
./start_ioc_hutch_temp_monitor.sh stop
./start_ioc_labjack.sh stop
./start_ioc_meas_comp.sh stop
popd
