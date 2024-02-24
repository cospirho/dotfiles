#!/bin/bash
# toggles between chinese and english input (fcitx5)

# get current input
current_input=$(fcitx5-remote)

# toggle input
if [ $current_input = "2" ]; then
    fcitx5-remote -s 1
else
    fcitx5-remote -s 2
fi
