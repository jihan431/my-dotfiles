#!/bin/bash

if pgrep waybar > /dev/null; then
  ~/.config/hypr/scripts/togle-waybar.sh &
else
  ~/.config/hypr/scripts/togle-waybar2.sh &
fi
