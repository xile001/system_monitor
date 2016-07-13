#!/bin/bash
#disk

df_setup(){
    local disk_file="${ROOT_PATH}/system/disk.list"

    #文件是否存在
    if [ ! -e $disk_file ];then
       touch $disk_file
    fi

    df -P|tail -n +2 > $disk_file

    while read LINE
    do
      $DB_EXEC -e "insert into ${DB_DATABASE}.disk_use_log(ip32,ip64,minute,filesystem_name,\`blocks\`,\`used\`,available,\`use\`,mounted_on)values('${ip32_addr}','${ip64_addr}',${now_time},'`echo $LINE|awk '{print $1}'`','`echo $LINE|awk '{print $2}'`','`echo $LINE|awk '{print $3}'`','`echo $LINE|awk '{print $4}'`','`echo $LINE|awk '{print $5}'`','`echo $LINE|awk '{print $6}'`')"
    done < $disk_file
}
df_setup
