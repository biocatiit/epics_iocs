#!/bin/bash
pushd /opt/epics/epics_iocs/shortcuts
./start_ioc_bleps.sh start
./start_ioc_galil_dmc_e01.sh start
./start_ioc_galil_dmc_e02.sh start
./start_ioc_galil_dmc_e03.sh start
./start_ioc_galil_dmc_e04.sh start
./start_ioc_galil_dmc_e05.sh start
./start_ioc_galil_dmc_a01.sh start
./start_ioc_hutch_temp_monitor.sh start
./start_ioc_coflow_temp_monitor.sh start
./start_ioc_labjack.sh start
./start_ioc_meas_comp_etc.sh start
./start_ioc_meas_comp_e1608.sh start
./start_ioc_newport_d_hutch.sh start
./start_ioc_newport_tr.sh start
./start_ioc_newport_hexapod.sh start
./start_ioc_memmert_incubator.sh start
./start_ioc_camera_inline.sh start
./start_ioc_camera_tripod.sh start
./start_ioc_camera_screen.sh start
./start_ioc_camera_mono2.sh start
./start_ioc_camera_mono1.sh start
popd
