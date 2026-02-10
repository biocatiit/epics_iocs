#!/bin/bash
pushd /opt/epics/epics_iocs/soft_iocs/sydor_bsharp/iocBoot/iocsydor_bsharp_chutch
./ioc_start.sh $1
popd
