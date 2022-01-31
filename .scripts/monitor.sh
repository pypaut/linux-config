#!/bin/bash

EXTERNAL_OUTPUT="DP-2"
INTERNAL_OUTPUT="eDP-1"

EXTERNAL_RES="1920x1080"
INTERNAL_RES="1920x1080"

EXTERNAL_POS="left-of"


# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="INT"

# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

if [ "$1" = "change" ]; then
    if [ $monitor_mode = "MIX" ]; then
            monitor_mode="EXT"
            xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --mode $EXTERNAL_RES
    elif [ $monitor_mode = "EXT" ]; then
            monitor_mode="INT"
            xrandr --output $INTERNAL_OUTPUT --mode $INTERNAL_RES --output $EXTERNAL_OUTPUT --off
    elif [ $monitor_mode = "INT" ]; then
            monitor_mode="CP"
            xrandr --output $INTERNAL_OUTPUT --mode $INTERNAL_RES \
                --output $EXTERNAL_OUTPUT --mode $EXTERNAL_RES \
                --same-as $INTERNAL_OUTPUT
    else
            monitor_mode="MIX"
            xrandr --output $INTERNAL_OUTPUT --mode $INTERNAL_RES \
                --output $EXTERNAL_OUTPUT --mode $EXTERNAL_RES \
                --$EXTERNAL_POS $INTERNAL_OUTPUT
    fi
    echo "${monitor_mode}" > /tmp/monitor_mode.dat
fi

echo "${monitor_mode}"
