#!/bin/bash

INTERNAL="eDP-1"
EXTERNAL="DP-2"

# Check file or create it
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="INT"
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

# Change monitor
if [ $monitor_mode = "INT" ]; then
    xrandr --output $EXTERNAL --mode 2560x1440 --output $INTERNAL --off && \
    monitor_mode="EXT"
else
    xrandr --output $EXTERNAL --off --output $INTERNAL --mode 1920x1080 && \
    monitor_mode="INT"
fi

# Update file value
echo "${monitor_mode}" > /tmp/monitor_mode.dat

# Restore wallpaper
nitrogen --restore
