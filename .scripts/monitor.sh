#!/bin/bash

INTERNAL="eDP-1"
INTERNAL_MODE="1920x1080"
EXTERNAL=$(xrandr | grep connected | grep -v disconnected | grep -v ${INTERNAL} | awk '{ print $1 }')

# Check file or create it
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="INT"
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

# Change monitor
if [ $monitor_mode = "INT" ]; then
    # Try 2560x1440, if fail then 1920x1080
    ( xrandr --output $EXTERNAL --mode 2560x1440 --output $INTERNAL --off ||
    xrandr --output $EXTERNAL --mode 1920x1080 --output $INTERNAL --off ) && \
    monitor_mode="EXT"
else
    xrandr --output $EXTERNAL --off --output $INTERNAL --mode $INTERNAL_MODE && \
    monitor_mode="INT"
fi

# Update file value
echo "${monitor_mode}" > /tmp/monitor_mode.dat

# Restore wallpaper
nitrogen --restore
