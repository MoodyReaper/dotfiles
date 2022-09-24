#!/bin/bash

COUNT=$(dunstctl count waiting)
ENABLED=
DISABLED=
if [ $COUNT != 0 ]; then DISABLED=" $COUNT"; fi
if dunstctl is-paused | grep -q "false"; then
    echo '{"text": "'"$ENABLED"'", "tooltip": "Dunst noficitaions are enabled", "class": "custom-enabled"}'
else echo '{"text": "'"$DISABLED"'", "tooltip": "Dunst noficitaions are disabled", "class": "custom-disabled"}'; fi
