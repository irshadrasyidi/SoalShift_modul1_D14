#!/bin/bash

#res1=$(cat soal2a.txt)

#echo $res1

awk -F ',' '{if($7 == "2012" && $1 == "United States" && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection")) arr[$6]+=$10} END { for(i in arr){print arr[i]","i} }' WA_Sales_Products_2012-14.csv | sort -n -r | awk -F ',' '{print $2}' | head -3
