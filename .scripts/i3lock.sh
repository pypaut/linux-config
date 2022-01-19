#!/bin/bash

kill -SIGUSR1 $(pidof dunst) && \
i3lock -t -n -i $HOME/Pictures/System/lock.png && \
kill -SIGUSR2 $(pidof dunst)
