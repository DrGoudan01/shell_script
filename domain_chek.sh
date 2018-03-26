#!/bin/bash
Make_file(){
	File_name=domain_file.txt
	test -f $File_name && rm -f $File_name
	echo -e "请输入,空行时结束输入：\r"
	while read line;
	do
		if [[ ${line} = ""  ]];
			then
			echo "请稍等..."
			echo ""
			break
		fi
	echo $line >>  $File_name
	done
}

Check_exe(){
	cat $1 | awk '{print $1}' |xargs dig | grep IN
}
Delete_file(){
	rm -f $File_name
}
#############
##############


if [[ $1 != ""  ]]
then
	File_name=$1
	Check_exe $File_name
else
	Make_file
	Check_exe $File_name
	Delete_file
fi