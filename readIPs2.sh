#!/bin/bash
exec > ~/Desktop/rpi_backup/`date '+%Y-%m-%d'`-backup.log
yesterday=`date -v-1d '+%Y-%m-%d'`
while read NAME IP
do
    #echo "Name: $NAME"
    #echo "IP: $IP"
    filename="$NAME-$yesterday.csv"
    #echo $filename
    if ssh pi@$IP "[ -f /home/pi/$filename ]";
    then
	echo "$NAME: file exists, copying"
	scp pi@$IP:/home/pi/$filename ~/Desktop/Rpi_backup/$NAME/
    else
    echo "$NAME: no file (or ssh failure)"
    fi
    

#echo $filename
done 

