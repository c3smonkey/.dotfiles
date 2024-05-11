#!/usr/bin/env bash
tmux split-window -v
tmux select-pane -t :.+
tmux send-keys "vi +Explor" Enter
tmux select-pane -t 1
tmux send-keys "lt2" Enter
