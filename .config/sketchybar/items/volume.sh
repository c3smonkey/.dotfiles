#!/bin/bash

sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" \
                                 label.color=$ACCENT_COLOR \
                                 icon.color=$ACCENT_COLOR \
           --subscribe volume volume_change
