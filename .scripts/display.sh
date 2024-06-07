#!/bin/sh

# VARIABLES

INTERNAL="eDP-1"
INTERNAL_MODE="1920x1080"

EXTERNAL=$(xrandr | grep connected | grep -v disconnected | grep -v ${INTERNAL} | awk '{ print $1 }')
EXTERNAL_MODE_1="2560x1440"
EXTERNAL_MODE_2="1920x1080"

CACHE_FILE="/tmp/display_mode.dat"


# FUNCTIONS

display_int() {
    xrandr --output $EXTERNAL --off --output $INTERNAL --mode $INTERNAL_MODE && \
    echo "INT" > ${CACHE_FILE}
}

display_ext() {
    ( xrandr --output $EXTERNAL --mode $EXTERNAL_MODE_1 --output $INTERNAL --off ||
    xrandr --output $EXTERNAL --mode $EXTERNAL_MODE_2 --output $INTERNAL --off ) && \
    echo "EXT" > ${CACHE_FILE}
}

display_mix() {
    ( xrandr --output $EXTERNAL --mode $EXTERNAL_MODE_1 --output $INTERNAL --mode $INTERNAL_MODE ||
    xrandr --output $EXTERNAL --mode $EXTERNAL_MODE_2 --output $INTERNAL --mode $INTERNAL_MODE) && \
    echo "MIX" > ${CACHE_FILE}
}


# MAIN

case "$1" in
    "int" | "") display_int ;;
    "ext") display_ext ;;
    "mix") display_mix ;;
    "switch")
        DISPLAY_MODE=`cat $CACHE_FILE`
        case "$DISPLAY_MODE" in
            "INT") display_mix ;;
            "MIX") display_ext ;;
            "EXT") display_int ;;
        esac
        ;;
    *) echo "$1 : unrecognized command" ;;
esac

nitrogen --restore > /dev/null 2>&1
DISPLAY_MODE=`cat $CACHE_FILE`
dunstify "DISPLAY" "${DISPLAY_MODE}"
echo $DISPLAY_MODE
