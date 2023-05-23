#!/bin/bash

set -euo pipefail

# Credits:
# https://github.com/Misterio77/dotfiles/blob/sway/home/.config/waybar/config.json

THEME=$(flavours current)
echo '{"text": "", "tooltip": "Current theme: '"$THEME"'"}'
