#!/bin/sh

sink='@DEFAULT_SINK@'
mute_status=$(pactl get-sink-mute ${sink} | awk '{ print $2 }')
vol=$(pactl get-sink-volume ${sink} | awk '{print $5}')

if [ "$mute_status" = "yes" ]; then
    echo "VOL: ($vol)"
else
    echo "VOL: $vol"
fi
