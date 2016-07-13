#!/bin/bash
# netstat

netstat_setup(){
    local netstat_file="${ROOT_PATH}/system/netstat.list"

    #文件是否存在
    if [ ! -e $netstat_file ];then
       touch $netstat_file
    fi

    netstat -nut |awk 'NR>2 {print $5}'|uniq -c > $netstat_file

    while read LINE
    do
        $DB_EXEC -e "insert into ${DB_DATABASE}.network_conn_log(ip32,ip64,minute,connection,address)values('${ip32_addr}','${ip64_addr}',${now_time},'`echo ${LINE}|awk '{print $1}'`','`echo ${LINE}|awk '{print $2}'`')"
    done < $netstat_file
}
netstat_setup