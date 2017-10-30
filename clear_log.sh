#!/usr/bin/bash
#一个日志切割和备份脚本
#分为三个函数（时间函数，清除最老文件(对于备份的日志)和复制文件）和一个主体
filename_date()
{
time_flag=$(date+%Y%m%d%H%M%S)
Name_Return=$1.$time_flag
}
#注意在shell脚本中函数的变量是全局的，只有用子shell（）声明的变量才是局部的
search_dir()
{
oldestlog= `ls -rt | head -n 1 |awk '{print $1}'`
#此处输出创建时间最长的文件，只要修改ls的参数就可改变搜索方式,如使用-sr可以输出最小的文件
#其中-r的为反向输出

}
#设定参数，文件大小和目录
working_dir=/var/log
dst_dir=/mnt/back_log
max_size_of_dir=500
clear_old_log()
{
cd $dst_dir
while true;do
	#du的参数，m表示以M为单位，s表示目录下文件的总和
	log_size=`du -ms $dst_dir|awk 'print $1'`
	if [ $log_size -gt $max_size_of_dir ];
		then
		search_dir
		rm -rf $oldestlog
	else
		break;
	fi
done

}
#开始主体部分
max_size_of_log = 5
backup_log()
{
	cd $working_dir
	#for循环直接遍历目录
	for i in * ;do #注意此段语法
		file_size = `du -m $i | awk 'print $1'`
		case i in #使用case创建白名单目录
		access.log | error.log|mail.log)
				if [ !-d $dst_dir ]
					then
					mkdir -p $dst_dir
					#-p参数，不输出错误信息
				fi
				if [[ file_size >= max_size_of_log ]]; then
					filename_date $i
					cp $working_dir/$i $dst_dir/$Name_Return
					echo " " > $working_dir$i #注意此处，如果直接删除文件空间不会立刻释放，而需要进程停止访问，此时直接覆盖是最好的选择
					#备份完成后可以对备份文件夹进行一次清洗,从逻辑上将可以放在循环完成后，这样效率更高
					clear_old_log
				fi
		*)
			#对于不在名单内的文件，直接清空
			if [[ file_size >= max_size_of_log ]]; then
				echo " " > $working_dir$i
			fi
		esac
	done
}














