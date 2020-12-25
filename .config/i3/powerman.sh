#!/bin/sh

i3-nagbar -t warning \
    -m 'So, what do you want today?' \
    -b 'Lock' '$HOME/.config/i3/i3lock.sh' \
    -b 'Logout' 'i3-msg exit' \
    -b 'Shutdown' 'shutdown 0'
