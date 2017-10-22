#!/bin/sh

ffmpeg -i $1 -vcodec $2 -q:v 5 -an -t 5 -y 1out.avi

a=1

while [ $a -lt $3 ]
do
   file="`expr $a - 0`out.avi"
   old="`expr $a - 1`out.avi"
   remove="`expr $a - 2`out.avi"
   #echo $old
   #echo $fil
   echo $remove
   ffmpeg -i $old -vcodec $2 -q:v 5 -y $file
   rm -f $remove
   if [ $a -eq $3 ]
   then
      break
   fi
   a=`expr $a + 1`
done
rm -f $old
