#!/bin/bash

set -euo pipefail

file="$HOME/.config/sway/config.d/theme"
if [[ ! -f $file ]]; then exit 1; fi

# shellcheck disable=SC2016
alpha_string='set $opacity'
alpha_search_result=$(grep "$alpha_string" "$file")
alpha_value=$(cut -d " " -f3 <<<"$alpha_search_result")

colors=(base00 base01 base02 base03 base04 base05 base06 base07 base08 base09 base0A base0B base0C base0D base0E base0F)

for color in "${colors[@]}"; do
  search_string="set \$$color #"
  search_result=$(grep "$search_string" "$file")
  color_value=$(cut -d "#" -f2 <<<"$search_result")
  alpha_color_string="set $"$color-alpha" #$color_value$alpha_value"
  sed -i "s/$search_string.*/&\n$alpha_color_string/" "$file"
done
