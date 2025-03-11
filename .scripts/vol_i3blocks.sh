#!/bin/sh


sink='@DEFAULT_SINK@'
dunst_id=10

mute_vol() {
    pactl set-sink-mute ${sink} toggle
}

decrease_vol() {
    pactl set-sink-volume ${sink} -5%
}

increase_vol() {
    pactl set-sink-volume ${sink} +5%
}

case "$1" in
    "mut") mute_vol ;;
    "dec") decrease_vol ;;
    "inc") increase_vol ;;
    "") ;;
    *) echo "$1 : unrecognized command" ;;
esac

# Update i3blocks
pkill -SIGRTMIN+11 i3blocks
