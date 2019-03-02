#!/bin/bash

kecil=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
besar=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

#echo ${kecil:26}${besar:26}
#echo ${kecil:10:26}
x=$(date +"%H")
input="/var/log/syslog"
#echo $x

if [ ${x:0:1} == 0 ]
then
 x=${x:1:1}
fi
#echo $x
#echo ${x:0:1}

backupfile=$(date +"%H:%M %d-%m-%Y")
#echo $backupfile
#echo ${backupfile:0:1}
#echo ${backupfile:1}

if [ ${backupfile:0:1} == 0 ]
then
 backupfile=${backupfile:1}
fi

#echo $backupfile
#echo ${backupfile:0:1}
#echo ${backupfile:1}

cat $input | tr [${kecil:26}${besar:26}] [${kecil:$x:26}${besar:$x:26}] > "$backupfile"

