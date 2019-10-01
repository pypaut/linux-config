#!/bin/sh

tmux new-session -d 'cmus'
tmux split-window -h 'vis'
tmux -2 attach-session -d
