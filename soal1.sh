#!/bin/bash

urutan=1
for file in /home/irshadrasyidi/Documents/SISOP/MODUL1/SOALSHIFT/no1/nature/*.jpg
do
 base64 -d $file | xxd -r > /home/irshadrasyidi/Documents/SISOP/MODUL1/SOALSHIFT/no1/decrypted/"gbr"$urutan".jpg"
let name++
done
