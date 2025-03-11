#!/bin/bash


source='@DEFAULT_SOURCE@' # internal
# source=5 # external webcam

mute_status=$(pactl get-source-mute ${source} | awk '{ print $2 }')

if [[ $mute_status = "no" ]]; then
    echo "MIC: ON" && echo "MIC: ON" && echo "#FF8000"
else
    echo "MIC: OFF"
fi

# Throw signal to update bar
pkill -SIGRTMIN+10 i3blocks
