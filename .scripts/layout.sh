#!/bin/bash


get_layout() {
    layout=`setxkbmap -query | grep variant`
    layout="${layout##* }"
}


change_layout() {
    get_layout

    if [ "$layout" = "" ]; then
        new_layout="us intl alt"
    elif [ "$layout" = "intl" ]; then
        new_layout="us"
    fi

    setxkbmap $new_layout
}


display_layout() {
    get_layout

    if [ "$layout" = "" ]; then
        display_layout="US"
    elif [ "$layout" = "intl" ]; then
        display_layout="INTL"
    fi

    echo $display_layout
}


if [ "$1" = "change" ]; then
    change_layout
fi

display_layout
