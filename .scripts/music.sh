#!/bin/sh

dunst_id=10

notify_title() {
    current_title=`cmus-remote -Q | grep "file" | sed 's/file \/home\/geoffrey\/Music\///'`
    dunstify -C ${dunst_id}
    dunstify -r ${dunst_id} "Music" "$current_title"
}

case "$1" in
    "previous") cmus-remote --prev && notify_title ;;
    "play_pause") cmus-remote --pause ;;
    "next") cmus-remote --next && notify_title ;;
    "") ;;
    *) echo "$1 : unrecognized command" ;;
esac
