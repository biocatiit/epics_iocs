#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/huber_atten/iocBoot/iochuber_atten
./ioc_start.sh $1
popd
