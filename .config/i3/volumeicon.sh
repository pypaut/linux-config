#!/bin/sh

# Kill app
killall -q volumeicon

# Wait until completely closed
while pgrep -u $UID -x volumeicon >/dev/null; do sleep 1; done

# Relaunch
volumeicon &
