#!/bin/bash


# source="alsa_input.pci-0000_00_1f.3.analog-stereo"
# source=$(pacmd list-sources | awk '/\*/,EOF {print $3; exit}') # idk but it works
source=1 # internal
# source=5 # external webcam

mute_status=$(pactl get-source-mute ${source} | awk '{ print $2 }')

if [[ $mute_status = "no" ]]; then
    echo "MIC: ON" && echo "MIC: ON" && echo "#FF8000"
else
    echo "MIC: OFF"
fi

# Throw signal to update bar
pkill -SIGRTMIN+10 i3blocks
