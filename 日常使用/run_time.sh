#!/bin/bash
#对脚本运行时间的计算
start_time=`date +"%s"`

TDATE=`date '+%Y-%m-%d'`
CDATE=`date '+%Y-%m-%d-%H:%M:%S'`
end_time=`date +"%s"`
minute=$(( (${end_time} - ${start_time})/60 ))
second=$(( (${end_time} - ${start_time})%60 ))

echo "执行时间：${minute} 分 ${second} 秒"
