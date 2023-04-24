#!/usr/bin/bash

# DEPRECATED: check flavours-swaylock-alpha-colors.sh instead

# swaylock-effects: https://github.com/mortie/swaylock-effects
# Base16 colors: https://github.com/chriskempson/base16/blob/master/styling.md

# Getting colors from Sway config
file="$HOME/.config/sway/config.d/theme"

# shellcheck disable=SC2016
alpha_string='set $opacity'
alpha_search_result=$(grep "$alpha_string" "$file")
alpha_value=$(cut -d " " -f3 <<<"$alpha_search_result")

colors=(base01 base02 base03 base05 base07 base08)

for color in "${colors[@]}"; do
  search_string="set \$$color #"
  search_result=$(grep "$search_string" "$file")
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

arguments="--show-failed-attempts \
--effect-blur 20x3 --fade-in 1 \
--show-keyboard-layout \
--indicator-caps-lock \
--clock --timestr %H:%M:%S --datestr %A \
--font FiraCode_Nerd_Font --font-size 24 \
--indicator-radius 120 --indicator-thickness 13 --indicator-idle-visible \
--line-uses-inside \
--layout-bg-color $inside_color --layout-border-color $inside_color --layout-text-color $text_color \
--ring-color $ring_color --ring-wrong-color $error_color --ring-ver-color $verifying_color --ring-clear-color $cleared_color --ring-caps-lock-color $ring_color \
--inside-color $inside_color --inside-wrong-color $error_color --inside-ver-color $verifying_color --inside-clear-color $cleared_color --inside-caps-lock-color $verifying_color \
--text-color $text_color --text-clear-color $text_color --text-ver-color $text_color --text-wrong-color $text_color --text-caps-lock-color $text_color \
--key-hl-color $highlight_color --caps-lock-key-hl-color $highlight_color --bs-hl-color $cleared_color --caps-lock-bs-hl-color $cleared_color \
--separator-color $ring_color"

# No needed with --line-uses-inside or --line-uses-ring
# --line-color $inside_color --line-wrong-color $error_color --line-ver-color $verifying_color --line-clear-color $cleared_color --line-caps-lock-color $highlight_color   \

swaylock "$arguments" "$@"
