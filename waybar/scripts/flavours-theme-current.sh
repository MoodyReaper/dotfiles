#!/bin/bash

# Credits:
# https://github.com/Misterio77/dotfiles/blob/sway/home/.config/waybar/config.json

THEME=$(flavours current)
echo '{"text": "嗀", "tooltip": "Current theme: '"$THEME"'"}'
