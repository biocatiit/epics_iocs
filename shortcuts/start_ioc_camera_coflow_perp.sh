#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/flir_cameras/iocBoot/iocflir_d_coflow_perp
./ioc_start.sh $1
popd
