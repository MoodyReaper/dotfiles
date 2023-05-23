#!/bin/bash

set -euo pipefail

# Note: script is used as Flavours hook

# swaylock-effects: https://github.com/mortie/swaylock-effects
# Base16 colors: https://github.com/chriskempson/base16/blob/master/styling.md
# Flavours: https://github.com/Misterio77/flavours

# Getting colors from Sway config
sway_config="$HOME/.config/sway/config.d/theme"
if [[ ! -f $sway_config ]]; then exit 1; fi
# Setting colors in Swaylock config
swaylock_config="$HOME/.config/swaylock/config"
if [[ ! -f $swaylock_config ]]; then exit 1; fi

# shellcheck disable=SC2016
alpha_string='set \$opacity'
alpha_search_result=$(grep "$alpha_string" "$sway_config")
alpha_value=$(cut -d " " -f3 <<<"$alpha_search_result")

colors=(base01 base02 base03 base05 base07 base08)

for color in "${colors[@]}"; do
  search_string="set \$$color #"
  search_result=$(grep "$search_string" "$sway_config")
  color_value=$(cut -d "#" -f2 <<<"$search_result")
  declare "$color=#$color_value"
done

inside_color=$base01$alpha_value
ring_color=$base02
error_color=$base08$alpha_value
cleared_color=$base03$alpha_value
highlight_color=$base07$alpha_value
verifying_color=$base03$alpha_value
text_color=$base05$alpha_value

declare -A arguments

arguments['layout-bg-color']=$inside_color
arguments['layout-border-color']=$inside_color
arguments['layout-text-color']=$text_color

arguments['ring-color']=$ring_color
arguments['ring-wrong-color']=$error_color
arguments['ring-ver-color']=$verifying_color
arguments['ring-clear-color']=$cleared_color
arguments['ring-caps-lock-color']=$ring_color

arguments['inside-color']=$inside_color
arguments['inside-wrong-color']=$error_color
arguments['inside-ver-color']=$verifying_color
arguments['inside-clear-color']=$cleared_color
arguments['inside-caps-lock-color']=$verifying_color

arguments['text-color']=$text_color
arguments['text-clear-color']=$text_color
arguments['text-ver-color']=$text_color
arguments['text-wrong-color']=$text_color
arguments['text-caps-lock-color']=$text_color

arguments['key-hl-color']=$highlight_color
arguments['caps-lock-key-hl-color']=$highlight_color
arguments['bs-hl-color']=$cleared_color
arguments['caps-lock-bs-hl-color']=$cleared_color

arguments['separator-color']=$ring_color

for key in "${!arguments[@]}"; do
  search_string="$key="
  replacement_string=$search_string${arguments[${key}]}
  sed -i "/^$search_string/c $replacement_string" "$swaylock_config"
done
