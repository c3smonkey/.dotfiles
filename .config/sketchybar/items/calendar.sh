#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon=􀧞  \
                          label.color=$ACCENT_COLOR \
                          icon.color=$ACCENT_COLOR \
                          update_freq=30 \
                          script="$PLUGIN_DIR/calendar.sh"
