#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/memmert_incubator
./ioc_start.sh $1
popd
