#!/bin/bash

kecil=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
besar=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

x=$(date +"%H")
input="/var/log/syslog"

if [ ${x:0:1} == 0 ]
then
 x=${x:1:1}
fi

backupfile=$(date +"%H:%M %d-%m-%Y")

if [ ${backupfile:0:1} == 0 ]
then
 backupfile=${backupfile:1}
fi

cat $input | tr [${kecil:26}${besar:26}] [${kecil:$x:26}${besar:$x:26}] > "$backupfile"

