#!/bin/sh
if [ -f /run/secrets/xfinity.env ] ; then
    source /run/secrets/xfinity.env
    export XFINITY_USER XFINITY_PASSWORD
fi

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

if [ -z "$INTERVAL" ] ; then
    xfinity-usage $cmd_args
    exit 0;
fi

while true
do xfinity-usage $cmd_args
sleep $INTERVAL
done
