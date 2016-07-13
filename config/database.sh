#!/bin/bash
#database config
#set -e -u
readonly DB_HOST=""
readonly DB_UNAME=""
readonly DB_PWD=""
readonly DB_PORT="3306"
readonly DB_DATABASE="auto_media_api"

# mysql客户端路径
readonly MYSQL_CLIENT_PATH=`which mysql`

# mysql执行
readonly DB_EXEC="${MYSQL_CLIENT_PATH} -h${DB_HOST} -u${DB_UNAME} -p${DB_PWD}"