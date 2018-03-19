#!/bin/sh

mkdir $3
mkfifo ./$3/fifo1
mkfifo ./$3/fifo2

FFMPEG -i $1 -f $2 -y -t $4 ./$3/1out.$2

a=1


while [ $a -lt $6 ]
do
   file="`expr $a - 0`out.$2"
   old="`expr $a - 1`out.$2"
   remove="`expr $a - 2`out.$2"
   #echo $old
   #echo $fil
   echo $remove
   FFMPEG -i ./$3/$old -acodec $3 -strict -2 -q:a $5 -f $2 pipe:1 > ./$3/fifo1 | 
   CHEXR ./$3/fifo1 $7 $8 ./$3/fifo2 | 
   FFMPEG -i ./$3/fifo2 -acodec $3 -strict -2 -q:a $5 -y ./$3/$file |
   rm -f ./$3/$remove
   if [ $a -eq $6 ]
   then
      break
   fi
   a=`expr $a + 1`
done
FFMPEG -i ./$3/$file -f mp3 -y ./$3/$2-$3-$4-$5-$6x-$7-$8.mp3
wait
FFPLAY -i ./$3/$file
rm -f ./$3/$old
rm -f ./$3/$file
