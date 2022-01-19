#!/bin/sh


sink="alsa_output.pci-0000_00_1f.3.analog-stereo"

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
