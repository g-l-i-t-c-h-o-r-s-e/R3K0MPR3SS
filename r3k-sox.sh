#!/bin/sh

sox $1 -t $2 -r $3 1out

a=1

while [ $a -lt $4 ]
do
   file="`expr $a - 0`out"
   old="`expr $a - 1`out"
   remove="`expr $a - 2`out"
   #echo $old
   #echo $fil
   echo $remove
   sox $old -t $2  -r $3 $file
   rm -f $remove
   if [ $a -eq $4 ]
   then
      break
   fi
   a=`expr $a + 1`
done
rm -f $old
