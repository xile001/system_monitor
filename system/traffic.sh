#!/bin/bash
# traffic 网络流量

traffic_setup(){
    local ip32_addr
    local ip64_addr
    local traffic_info
    local traffic_file="./system/traffic.list"

    #文件是否存在
    if [ ! -e ${traffic_file} ];then
       touch ${traffic_file}
    fi

    tail -n +3 /proc/net/dev > ${traffic_file}

    for v in ${INTER_ACTIV}
    do
       ip32_addr=`ifconfig ${v}|grep 'inet addr'|awk 'NR==1{ print $2}'|cut -d: -f2`
       ip64_addr=`ifconfig ${v}|grep 'inet6 addr'|awk 'NR==1{ print $3}'`
       traffic_info=`grep $v ${traffic_file}|cut -d: -f2`

       ${DB_EXEC} -e "insert into ${DB_DATABASE}.traffic_use_log(ip32,ip64,minute,rx_packets,rx_bytes,rx_err,rx_drop,tx_packets,tx_bytes,tx_err,tx_drop)values('${ip32_addr}','${ip64_addr}',${now_time},'`echo ${traffic_info}|awk '{print $2}'`','`echo ${traffic_info}|awk '{print $1}'`','`echo ${traffic_info}|awk '{print $3}'`','`echo ${traffic_info}|awk '{print $4}'`','`echo ${traffic_info}|awk '{print $10}'`','`echo ${traffic_info}|awk '{print $9}'`','`echo ${traffic_info}|awk '{print $11}'`','`echo ${traffic_info}|awk '{print $12}'`')"
    done
}
traffic_setup