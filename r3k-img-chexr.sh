#!/bin/sh

mkdir $3
mkfifo ./$3/fifo1
mkfifo ./$3/fifo2

ffmpeg -i $1 -pix_fmt $4 -y ./$3/1out.$2

a=1


while [ $a -lt $6 ]
do
   file="`expr $a - 0`out.$2"
   old="`expr $a - 1`out.$2"
   remove="`expr $a - 2`out.$2"
   #echo $old
   #echo $fil
   echo $remove
   ffmpeg -i ./$3/$old -vcodec $3 -strict -2 -q:v $5 -bf 0 -g 9999 -f avi pipe:1 > ./$3/fifo1 | 
   chexr ./$3/fifo1 $7 $8 ./$3/fifo2 | 
   ffmpeg -i ./$3/fifo2 -pix_fmt $4 -y ./$3/$file |
   rm -f ./$3/$remove
   if [ $a -eq $6 ]
   then
      break
   fi
   a=`expr $a + 1`
done
rm -f ./$3/$old
