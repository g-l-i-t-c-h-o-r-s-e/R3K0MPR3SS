#!/bin/sh

ffmpeg -i $1 -q:a $3 -af $5=$6,$7=$8 -y 1out.$2

a=1

while [ $a -lt $4 ]
do
   file="`expr $a - 0`out.$2"
   old="`expr $a - 1`out.$2"
   remove="`expr $a - 2`out.$2"
   #echo $old
   #echo $fil
   echo $remove
   ffmpeg -i $old -q:a $3 -af $5=$6,$7=$8 -y $file
   rm -f $remove
   if [ $a -eq $4 ]
   then
      break
   fi
   a=`expr $a + 1`
done
ffplay -i $file
rm -f $old

