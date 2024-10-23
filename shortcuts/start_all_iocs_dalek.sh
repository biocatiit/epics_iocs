#!/bin/bash

/opt/epics/epics_iocs/shortcuts/start_ioc_bleps.sh start </dev/null >/dev/null 2>&1
/opt/epics/epics_iocs/shortcuts/start_ioc_galil_dmc_e03.sh start </dev/null >/dev/null 2>&1
/opt/epics/epics_iocs/shortcuts/start_ioc_galil_dmc_e04.sh start </dev/null >/dev/null 2>&1
/opt/epics/epics_iocs/shortcuts/start_ioc_galil_dmc_e05.sh start </dev/null >/dev/null 2>&1
/opt/epics/epics_iocs/shortcuts/start_ioc_hutch_temp_monitor.sh start </dev/null >/dev/null 2>&1
/opt/epics/epics_iocs/shortcuts/start_ioc_labjack.sh start </dev/null >/dev/null 2>&1
/opt/epics/epics_iocs/shortcuts/start_ioc_meas_comp.sh start </dev/null >/dev/null 2>&1

