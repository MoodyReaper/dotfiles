#!/bin/bash

set -euo pipefail

PAUSED=$(dunstctl is-paused)
ENABLED=
DISABLED=

if [[ $PAUSED == "false" ]]; then
  echo '{"text": "'"$ENABLED"'", "tooltip": "Dunst notifications are enabled", "class": "custom-enabled"}'
else
  COUNT=$(dunstctl count waiting)
  if [[ $COUNT != 0 ]]; then DISABLED=" $COUNT"; fi
  echo '{"text": "'"$DISABLED"'", "tooltip": "Dunst notifications are disabled", "class": "custom-disabled"}'
fi
