#!/bin/bash

script_name="batterycheck.sh"
script_path="/home/${USER}/.scripts/${script_name}"

# Terminate already running instances
ps -aux | grep $script_name | grep -v grep | awk '{ print $2 }' | xargs kill -9

# Wait until the processes have been shut down
while pgrep -u $UID -x $script_name >/dev/null; do sleep 1; done

# Launch sript
sh $script_path &

echo "Battery check launched..."

