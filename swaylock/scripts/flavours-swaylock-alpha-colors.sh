#!/usr/bin/bash

# Note: script is used as Flavours hook

# swaylock-effects: https://github.com/mortie/swaylock-effects
# Base16 colors: https://github.com/chriskempson/base16/blob/master/styling.md
# Flavours: https://github.com/Misterio77/flavours

# Getting colors from Sway config
sway_config="$HOME/.config/sway/config.d/theme"
# Setting colors in Swaylock config
swaylock_config="$HOME/.config/swaylock/config"

alphastring="set \$opacity"
aphasearchresult=$(grep "$alphastring" $sway_config)
alphavalue=$(cut -d " " -f3 <<<"$aphasearchresult")

colors=(base01 base02 base03 base05 base07 base08)

for color in ${colors[@]}; do
    searchstring="set $"$color" #"
    searchresult=$(grep "$searchstring" $sway_config)
    colorvalue=$(cut -d "#" -f2 <<<"$searchresult")
    declare "$color=#$colorvalue"
done

insidecolor=$base01$alphavalue
ringcolor=$base02
errorcolor=$base08$alphavalue
clearedcolor=$base03$alphavalue
highlightcolor=$base07$alphavalue
verifyngcolor=$base03$alphavalue
textcolor=$base05$alphavalue

declare -A arguments

arguments[layout-bg-color]=$insidecolor
arguments[layout-border-color]=$insidecolor
arguments[layout-text-color]=$textcolor

arguments[ring-color]=$ringcolor
arguments[ring-wrong-color]=$errorcolor
arguments[ring-ver-color]=$verifyngcolor
arguments[ring-clear-color]=$clearedcolor
arguments[ring-caps-lock-color]=$ringcolor

arguments[inside-color]=$insidecolor
arguments[inside-wrong-color]=$errorcolor
arguments[inside-ver-color]=$verifyngcolor
arguments[inside-clear-color]=$clearedcolor
arguments[inside-caps-lock-color]=$verifyngcolor

arguments[text-color]=$textcolor
arguments[text-clear-color]=$textcolor
arguments[text-ver-color]=$textcolor
arguments[text-wrong-color]=$textcolor
arguments[text-caps-lock-color]=$textcolor

arguments[key-hl-color]=$highlightcolor
arguments[caps-lock-key-hl-color]=$highlightcolor
arguments[bs-hl-color]=$clearedcolor
arguments[caps-lock-bs-hl-color]=$clearedcolor

arguments[separator-color]=$ringcolor

for key in ${!arguments[@]}; do
    #echo ${key} ${arguments[${key}]}
    searchstring="$key="
    replacementstring=$searchstring${arguments[${key}]}
    #echo $replacementstring
    sed -i "/$searchstring/c $replacementstring" $swaylock_config
done
