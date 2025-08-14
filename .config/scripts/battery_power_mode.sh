#!/bin/bash

MODE_FILE="$HOME/.power_mode_state"
if [ ! -f "$MODE_FILE" ]; then
  echo "balanced" > "$MODE_FILE"
fi

if [ "$1" == "click" ]; then
  CURRENT=$(cat $MODE_FILE)
  if [ "$CURRENT" == "balanced" ]; then
    sudo cpupower frequency-set -g performance
    echo "performance" > $MODE_FILE
  elif [ "$CURRENT" == "performance" ]; then
    sudo cpupower frequency-set -g powersave
    echo "powersave" > $MODE_FILE
  else
    sudo cpupower frequency-set -g schedutil
    echo "balanced" > $MODE_FILE
  fi
fi

MODE=$(cat $MODE_FILE)

CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo "?")

if [ "$CAPACITY" == "?" ]; then
  BAT_ICON="󰂎"
elif [ "$CAPACITY" -ge 90 ]; then
  BAT_ICON="󰁹"
elif [ "$CAPACITY" -ge 75 ]; then
  BAT_ICON="󰁸"
elif [ "$CAPACITY" -ge 50 ]; then
  BAT_ICON="󰁷"
elif [ "$CAPACITY" -ge 25 ]; then
  BAT_ICON="󰁶"
else
  BAT_ICON="󰂂"
fi

case $MODE in
  performance)
    MODE_ICON="⚡️"
    ;;
  balanced)
    MODE_ICON="🔋"
    ;;
  powersave)
    MODE_ICON="🌿"
    ;;
  *)
    MODE_ICON="❓"
    ;;
esac

echo "{\"text\":\"$BAT_ICON $MODE_ICON\",\"tooltip\":\"Battery: $CAPACITY% — Mode: $MODE\"}"
