#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/srs/iocBoot/iocdg645
./ioc_start.sh $1
popd
