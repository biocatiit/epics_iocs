#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/coflow_temp_monitor
./ioc_start.sh $1
popd
