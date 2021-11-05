#!/bin/bash


if [ ! -f "/tmp/layout.dat" ]; then  # No file yet, start at 0
    layout="us intl alt"
else
    layout=`cat /tmp/layout.dat`
fi

if [ "$layout" = "us intl alt" ]; then
    layout="us"
elif [ "$layout" = "us" ]; then
    layout="fr"
elif [ "$layout" = "fr" ]; then
    layout="us intl alt"
else
    layout="us intl alt"
fi

setxkbmap $layout
echo "Layout $layout"
echo "$layout" > /tmp/layout.dat

