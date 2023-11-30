#!/bin/bash

# Get current PID, if any
battcheckpid=$(ps aux | grep batterycheck | grep -v grep | awk '{ print $2 }')

# Change state
if [[ $battcheckpid ]]; then
    kill -9 $battcheckpid
    dunstify "Battery check" "Off"
else
    /home/$USER/.scripts/batterychecklauncher.sh
    dunstify "Battery check" "On"
fi

