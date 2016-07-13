#!/bin/bash
#autoindex
# 当前路径
cd /root/shellcode/trunk/system_monitor
readonly ROOT_PATH=`pwd`
source ${ROOT_PATH}/global.sh
source ${ROOT_PATH}/system/top.sh &
source ${ROOT_PATH}/system/disk.sh &
source ${ROOT_PATH}/system/traffic.sh &
source ${ROOT_PATH}/system/netstat.sh &