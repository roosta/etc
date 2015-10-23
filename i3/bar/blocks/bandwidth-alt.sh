#!/bin/bash

if [ "$1" == "" ]; then
    echo "Missing required argument: 'tx' or 'rx'" 1>&2
    exit 1
fi
if [ "$1" != "rx" -a "$1" != "tx" ]; then
    echo "Invalid argument: $1" 1>&2
    echo "Usage: $0 (rx|tx)" 1>&2
    exit 1
fi

DIRECTION=$1
TMPFILE=/dev/shm/i3blocks_bandwidth_$DIRECTION
touch $TMPFILE

PREV=$(cat $TMPFILE)
NETDIR=/sys/class/net
IFACE=$(ip r | grep default | cut -d' ' -f5)
FILE=$NETDIR/$IFACE/statistics/${DIRECTION}_bytes
CUR=$(cat $FILE)
DELTA=$(expr $CUR - $PREV)

echo $(expr $DELTA / 1000) kB/s

echo $CUR > $TMPFILE
