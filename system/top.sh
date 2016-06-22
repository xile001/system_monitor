#!/bin/bash
#cpu memory process load_average

top_setup(){
    declare top_file="./system/top.list"

    #文件是否存在
    if [ ! -e ${top_file} ];then
       touch ${top_file}
    fi

    top -b -n 1 | head -n 5 > ${top_file}

    declare load_average_val=`sed -n '1p' ${top_file}` # 系统负载
    declare process_val=`sed -n '2p' ${top_file}`      # 进程
    declare cpu_val=`sed -n '3p' ${top_file}`          # CPU
    declare memory_val=`sed -n '4p' ${top_file}`       # 内存
    declare swap_val=`sed -n '5p' ${top_file}`       # 内存

    #load_average
    ${DB_EXEC} -e "insert into ${DB_DATABASE}.load_average_log(ip32,ip64,minute,val)values('${ip32_addr}','${ip64_addr}',${now_time},'${load_average_val}')"
    #process
    ${DB_EXEC} -e "insert into ${DB_DATABASE}.process_use_log(ip32,ip64,minute,val)values('${ip32_addr}','${ip64_addr}',${now_time},'${process_val}')"
    #cpu
    ${DB_EXEC} -e "insert into ${DB_DATABASE}.cpu_use_log(ip32,ip64,minute,val)values('${ip32_addr}','${ip64_addr}',${now_time},'${cpu_val}')"
    #memory
    ${DB_EXEC} -e "insert into ${DB_DATABASE}.memory_use_log(ip32,ip64,minute,val)values('${ip32_addr}','${ip64_addr}',${now_time},'${memory_val}')"
    #swap
    ${DB_EXEC} -e "insert into ${DB_DATABASE}.swap_use_log(ip32,ip64,minute,val)values('${ip32_addr}','${ip64_addr}',${now_time},'${swap_val}')"
}
top_setup
