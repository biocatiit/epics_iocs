#!/bin/bash
pushd /opt/epics/epics_iocs/shortcuts
./start_ioc_camera_inline.sh stop
./start_ioc_camera_tripod.sh stop
./start_ioc_camera_screen.sh stop
./start_ioc_camera_mono2.sh stop
./start_ioc_camera_mono1.sh stop
./start_ioc_camera_coflow_needle.sh stop
./start_ioc_camera_coflow_perp.sh stop
popd
