#!/bin/sh

ffmpeg -i $1 -y 1out.$2

a=1

while [ $a -lt $5 ]
do
   file="`expr $a - 0`out.$2"
   old="`expr $a - 1`out.$2"
   remove="`expr $a - 2`out.$2"
   #echo $old
   #echo $fil
   echo $remove
   ffmpeg -i $old -vcodec $3 -q:v $4 -f avi - | ffmpeg -i - -y $file
   rm -f $remove
   if [ $a -eq $5 ]
   then
      break
   fi
   a=`expr $a + 1`
done
rm -f $old
