#!/bin/bash -i
pushd /opt/epics/epics_iocs/soft_iocs/hutch_temp_monitor
./ioc_start.sh $1
popd
