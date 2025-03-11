#!/bin/sh

source=1 # internal
# source=5 # external webcam
source='@DEFAULT_SOURCE@'
pactl set-source-mute ${source} toggle

# Update i3blocks
pkill -SIGRTMIN+10 i3blocks
