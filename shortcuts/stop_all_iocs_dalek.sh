#!/bin/bash
pushd /opt/epics/epics_iocs/shortcuts
./start_ioc_bleps.sh stop
./start_ioc_galil_dmc_e01.sh stop
./start_ioc_galil_dmc_e02.sh stop
./start_ioc_galil_dmc_e03.sh stop
./start_ioc_galil_dmc_e04.sh stop
./start_ioc_galil_dmc_e05.sh stop
./start_ioc_hutch_temp_monitor.sh stop
./start_ioc_labjack.sh stop
./start_ioc_meas_comp.sh stop
./start_ioc_meas_comp_etc.sh stop
./start_ioc_meas_comp_e1608.sh stop
./start_ioc_newport_d_hutch.sh stop
./start_ioc_newport_tr.sh stop
./start_ioc_newport_hexapod.sh stop
popd
