#!/bin/bash

sketchybar --add item cpu right \
           --set cpu  update_freq=2 \
                      icon=􀧓  \
                      label.color=$ACCENT_COLOR \
                      icon.color=$ACCENT_COLOR \
                      script="$PLUGIN_DIR/cpu.sh"
