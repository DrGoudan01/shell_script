#!/bin/bash
WORK_PATH=`dirname $0`
echo $WORK_PATH
cd $WORK_PATH/
LOG_PATH=`pwd`/cross_gengxin/`date '+%Y-%m-%d'`.log
test -d $WORK_PATH/cross_gengxin/ || mkdir $WORK_PATH/cross_gengxin/
test -f WORK_PATH/cross_gengxin
echo -e  "====start====" > $LOG_PATH
echo -e "====stop====" >> $LOG_PATH
for i in 1 2 3 4 5 6  7 8;do
sed -i '/====start====/a append '$i' success!' $LOG_PATH
done
for i in 99 88 77 66 55 44 33 22 ;do
sed -i '/====stop====/a append '$i' success!' $LOG_PATH
done
