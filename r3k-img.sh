#!/bin/sh

ffmpeg -i $1 -pix_fmt $4 -y 1out.$2

a=1

while [ $a -lt $6 ]
do
   file="`expr $a - 0`out.$2"
   old="`expr $a - 1`out.$2"
   remove="`expr $a - 2`out.$2"
   #echo $old
   #echo $fil
   echo $remove
   ffmpeg -i $old -vcodec $3 -strict -2 -q:v $5 -f avi - | ffmpeg -i - -pix_fmt $4 -y $file
   rm -f $remove
   if [ $a -eq $6 ]
   then
      break
   fi
   a=`expr $a + 1`
done
rm -f $old
