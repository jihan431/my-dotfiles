#!/bin/bash
FLAGFILE="$HOME/.gamemode_active"

killall -q waybar
waybar &
killall -q hyprpaper
hyprpaper &

if [ -f "$FLAGFILE" ]; then
    cp ~/.config/waybar/themes/light.css ~/.config/waybar/style.css
    cp ~/.config/hypr/hyprpaper-set/light.conf ~/.config/hypr/hyprpaper.conf
    cp ~/.config/hypr/hyprland-set/light.conf ~/.config/hypr/hyprland.conf
    rm "$FLAGFILE"
    notify-send "Mode : balance" "Hyprland set balance"
    sudo cpupower frequency-set -g balance
else
    cp ~/.config/waybar/themes/dark.css ~/.config/waybar/style.css
    cp ~/.config/hypr/hyprpaper-set/dark.conf ~/.config/hypr/hyprpaper.conf
    cp ~/.config/hypr/hyprland-set/dark.conf ~/.config/hypr/hyprland.conf
    touch "$FLAGFILE"
    notify-send "Mode : performance" "Hyprland set performance"
    sudo cpupower frequency-set -g performance
fi
