#!/bin/bash

kecil=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
besar=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

input="11:13 02-03-2019"
x=${input:0:2}

if [[ ${x:0:1} =~ [0-9] ]] && [ ${x:1:1} == ":" ]
then
 x=${x:0:1}
fi

awk '{print}' "/home/irshadrasyidi/Documents/SISOP/MODUL1/SOALSHIFT/no4/$input" | tr "${kecil:$x:26}${besar:$x:26}" "${kecil:0:26}${besar:0:26}" > "/home/irshadrasyidi/Documents/SISOP/MODUL1/SOALSHIFT/no4/decrypted/$input"
