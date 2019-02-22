#!/bin/bash

no=1

while test -e "pword$no.txt";
do
 ((no++))
done

file="pword$no.txt"
password=$(</dev/urandom tr -dc A-Za-z0-9 | head -c 12)

echo "$password" > "$file"
