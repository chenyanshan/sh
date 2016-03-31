#!/bin/bash

vm_win10() {

win10_pid=`ps aux | grep {6248b065-598e-47de-9852-7dbf667fbba4} | grep VM | awk -F" " '{print $2}'`
win10_cpu=`top -l 2  | grep $win10_pid | awk -F' ' '$3>1 {print $3}'`
vm_win10_cpu=`echo $win10_cpu | awk -F'.' '{print $1}'`
if [ 8 -gt "$vm_win10_cpu" ];then
	win10_log_1=1
else
	win10_log_1=0
fi

}

win10_pid=`ps aux | grep {6248b065-598e-47de-9852-7dbf667fbba4} | grep VM`
if [ "$win10_pid" ];then
	vm_win10
	if [ "$win10_log_1" == 1 ];then
		if [ `cat /tmp/1` == 1 ];then
		osascript -e 'display notification "您虚拟机的视频似乎已经停止了" with title "虚拟机"'
		fi
	fi
	echo "$win10_log_1" > /tmp/1
fi
