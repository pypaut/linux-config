#!/bin/bash


mute() {
    kill -SIGUSR1 $(pidof dunst)
}

unmute() {
    kill -SIGUSR2 $(pidof dunst)
}

# if we don't have a file, start at zero
if [ ! -f "/tmp/notif_mode.dat" ] ; then
  notif_mode="ON"

# otherwise read the value from the file
else
  notif_mode=`cat /tmp/notif_mode.dat`
fi

if [ "$1" = "change" ]; then
    if [ $notif_mode = "ON" ]; then
        notif_mode="OFF"
        mute
    else
        notif_mode="ON"
        unmute
    fi

    echo "${notif_mode}" > /tmp/notif_mode.dat
fi

echo "${notif_mode}"
