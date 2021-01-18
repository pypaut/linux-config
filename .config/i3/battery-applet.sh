#!/bin/sh

# Kill app
killall -q xfce4-power-manager

# Wait until completely closed
while pgrep -u $UID -x xfce4-power-manager >/dev/null; do sleep 1; done

# Relaunch
xfce4-power-manager &

