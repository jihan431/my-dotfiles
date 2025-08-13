#!/bin/bash
FLAGFILE="$HOME/.gamemode_active"

if [ -f "$FLAGFILE" ]; then
    rm "$FLAGFILE"
else
    touch "$FLAGFILE"
fi
