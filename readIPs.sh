#!/bin/bash

yesterday=`date -v-1d '+%Y-%m-%d'`
while read NAME IP
do
    #echo "Name: $NAME"
    #echo "IP: $IP"
    filename="$NAME-$yesterday.csv"
    scp pi@$IP:/home/pi/$filename ~/Desktop/Rpi_backup/$NAME/ || true
    if true; then
       echo "$NAME copy failed"
    else
	echo "$NAME file copied"
    fi

#echo $filename
done 

