#!/usr/bin/bash

# DEPRECATED: check flavours-swaylock-alpha-colors.sh instead

# swaylock-effects: https://github.com/mortie/swaylock-effects
# Base16 colors: https://github.com/chriskempson/base16/blob/master/styling.md

# Getting colors from Sway config
file="$HOME/.config/sway/config.d/theme"

alphastring="set \$opacity"
aphasearchresult=$(grep "$alphastring" $file)
alphavalue=$(cut -d " " -f3 <<< "$aphasearchresult")

colors=(base01 base02 base03 base05 base07 base08)

for color in ${colors[@]}; do
    searchstring="set $"$color" #"
    searchresult=$(grep "$searchstring" $file)
    colorvalue=$(cut -d "#" -f2 <<< "$searchresult")
    declare "$color=#$colorvalue"
done

insidecolor=$base01$alphavalue
ringcolor=$base02
errorcolor=$base08$alphavalue
clearedcolor=$base03$alphavalue
highlightcolor=$base07$alphavalue
verifyngcolor=$base03$alphavalue
textcolor=$base05$alphavalue

arguments="--show-failed-attempts \
--effect-blur 20x3 --fade-in 1 \
--show-keyboard-layout \
--indicator-caps-lock \
--clock --timestr %H:%M:%S --datestr %A \
--font FiraCode_Nerd_Font --font-size 24 \
--indicator-radius 120 --indicator-thickness 13 --indicator-idle-visible \
--line-uses-inside \
--layout-bg-color $insidecolor --layout-border-color $insidecolor --layout-text-color $textcolor \
--ring-color $ringcolor --ring-wrong-color $errorcolor --ring-ver-color $verifyngcolor --ring-clear-color $clearedcolor --ring-caps-lock-color $ringcolor \
--inside-color $insidecolor --inside-wrong-color $errorcolor --inside-ver-color $verifyngcolor --inside-clear-color $clearedcolor --inside-caps-lock-color $verifyngcolor \
--text-color $textcolor --text-clear-color $textcolor --text-ver-color $textcolor --text-wrong-color $textcolor --text-caps-lock-color $textcolor \
--key-hl-color $highlightcolor --caps-lock-key-hl-color $highlightcolor --bs-hl-color $clearedcolor --caps-lock-bs-hl-color $clearedcolor \
--separator-color $ringcolor"

# No needed with --line-uses-inside or --line-uses-ring
# --line-color $insidecolor --line-wrong-color $errorcolor --line-ver-color $verifyngcolor --line-clear-color $clearedcolor --line-caps-lock-color $highlightcolor   \

swaylock $arguments $@
