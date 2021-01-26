#!/bin/sh

# Kill app
killall -q compton

# Wait until completely closed
while pgrep -u $UID -x compton >/dev/null; do sleep 1; done

# Relaunch
compton &
