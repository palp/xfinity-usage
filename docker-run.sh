#!/bin/sh
cmd_args="-vvb firefox-headless -g"
if [ ! -z "$GRAPHITE_HOST" ] ; then
    cmd_args="$cmd_args -H $GRAPHITE_HOST"
fi
if [ ! -z "$GRAPHITE_PORT" ] ; then
    cmd_args="$cmd_args -P $GRAPHITE_PORT"
fi
if [ ! -z "$GRAPHITE_PREFIX" ] ; then
    cmd_args="$cmd_args -P $GRAPHITE_PREFIX"
fi

while true
do xfinity-usage $cmd_args
sleep $INTERVAL
done
