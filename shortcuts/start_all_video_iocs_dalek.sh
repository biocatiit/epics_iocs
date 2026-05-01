#!/bin/bash
pushd /opt/epics/epics_iocs/shortcuts
./start_ioc_camera_inline.sh start
./start_ioc_camera_tripod.sh start
./start_ioc_camera_screen.sh start
./start_ioc_camera_mono2.sh start
./start_ioc_camera_mono1.sh start
./start_ioc_camera_coflow_needle.sh start
./start_ioc_camera_coflow_perp.sh start
popd
