#!/bin/bash

res1=$(cat soal2a.txt)
res2=$(cat soal2b.txt)

awk -F ',' '{if($1 -eq $res1  && $6 -eq $res2 && $7=="2012") arr[$6]+=$10} END { for(i in arr){print i" "arr[i]} }' WA_Sales_Products_2012-14.csv | sort -n -r | head -3
