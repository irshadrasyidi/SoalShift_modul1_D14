#!/bin/bash

res=$(cat soal2a.txt)

awk -F "," '{if($1=$res && $7=="2012") arr[$4]+=$10} END {for(i in arr)print i}' WA_Sales_Products_2012-14.csv | sort -n -r | head -3 > soal2b.txt
