#!/bin/bash
TMPFILE=$$.fifo
mkfifo $TMPFILE
exec 6<>$TMPFILE
rm -f $TMPFILE 	
PARALLEL=10
for ((i=0;i<${PARALLEL};i++))
do
	echo
done >&6
for plat_sn in `cat ${CURRENTPATH}/richang/plat_sn_game.conf`
do 
	read <&6 
	(
		echo "${i_test}${i_test}${i_test}${i_test}">${i_test}.test
        echo "========${i_test} is success====="
		sleep 5
		echo >&6
	)&
echo "=========finish ${i_test}========"
done
wait
exec 6>&-