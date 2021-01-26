#!/bin/sh

# Kill app
killall -q nm-applet

# Wait until completely closed
while pgrep -u $UID -x nm-applet >/dev/null; do sleep 1; done

# Relaunch
nm-applet &

