#!/bin/sh

FILE=$1

if [ ! -e $FILE ]; then
    echo "Error: File Not Found"
    exit 0
fi

MAX=0

while read line; do
    echo $line

    LEN=${#line}

    if [ $MAX -lt $LEN ]; then
	MAX=$LEN
    fi

    for (( i=0 ; i<$MAX; i++))
    do
	echo ${line:$i:1} >> /tmp/$i.txt
    done

    usleep 500000
    sed -i -e '1d' $1

done < $FILE

rm $1
