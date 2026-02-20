#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/flir_cameras/iocBoot/iocflir_d_tripod
./ioc_start.sh $1
popd
