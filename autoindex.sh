#!/bin/bash
#autoindex
cd /root/system_monitor
declare SHELL_PATH=`pwd`
source ${SHELL_PATH}/global.sh
source ${ROOT_PATH}/system/top.sh
source ${ROOT_PATH}/system/disk.sh
source ${ROOT_PATH}/system/traffic.sh
source ${ROOT_PATH}/system/netstat.sh
