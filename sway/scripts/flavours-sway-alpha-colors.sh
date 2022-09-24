#!/bin/bash

file="$HOME/.config/sway/config.d/theme"

alphastring="set \$opacity"
aphasearchresult=$(grep "$alphastring" $file)
alphavalue=$(cut -d " " -f3 <<<"$aphasearchresult")

colors=(base00 base01 base02 base03 base04 base05 base06 base07 base08 base09 base0A base0B base0C base0D base0E base0F)

for color in ${colors[@]}; do
    searchstring="set $"$color" #"
    searchresult=$(grep "$searchstring" $file)
    colorvalue=$(cut -d "#" -f2 <<<"$searchresult")
    alphacolorstring="set $"$color-alpha" #$colorvalue$alphavalue"
    sed -i "s/$searchstring.*/&\n$alphacolorstring/" $file
done
