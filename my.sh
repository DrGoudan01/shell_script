#!/bin/bash


#对脚本运行时间的计算
#start_time不能放在函数里，必须放在脚本开头
start_time=`date +"%s"`
sleep 5
TDATE=`date '+%Y-%m-%d'`
CDATE=`date '+%Y-%m-%d-%H:%M:%S'`

Time_calculate(){
	end_time=`date +"%s"`
	minute=$(( (${end_time}-${start_time})/60 ))
	second=$(( (${end_time}-${start_time})%60 ))
	echo "执行时间：${minute} 分 ${second} 秒"
	echo "执行时间："$(( ${end_time}-${start_time} )) "秒"
}

#倒计时，输入参数为倒计时时间($1)和语句($2)，间隔1S
#可加入超时函数，自行添加
#删除tac语句可以变为正数
Wait_word(){
	Wait_time=$1
	Echo_word=$2
	seq $Wait_time  |while read line; do
		echo -en "${Echo_word}...${line}/${Wait_time}\r"
		#status=""
		#if
		sleep 1
	done
}
