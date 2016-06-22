#!/bin/bash
#global

set -e -u

declare PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PATH

#当前时间
declare now_time=`date "+%s"` 
# 当前路径
export ROOT_PATH=`pwd`
# 载入数据库配置
source ${ROOT_PATH}/config/database.sh
# 载入网络配置
source ${ROOT_PATH}/config/network.sh
# 本机IP
declare default_ip=`echo ${INTER_ACTIV}|cut -d' ' -f1`
declare ip32_addr=`ifconfig ${default_ip}|grep 'inet addr'|awk 'NR==1{ print $2}'|cut -d: -f2` #本机ip32位地址
declare ip64_addr=`ifconfig ${default_ip}|grep 'inet6 addr'|awk 'NR==1{ print $3}'` #本机ip64位地址

