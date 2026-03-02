#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/srs/iocBoot/iocsrs570
./ioc_start.sh $1
popd
