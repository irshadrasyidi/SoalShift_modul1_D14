#!/bin/bash

awk -F ',' '{if($7='2012') arr[$1]+=$10} END { for(x in arr){print x} }' WA_Sales_Products_2012-14.csv | sort -n -r | head -1 > soal2a.txt
