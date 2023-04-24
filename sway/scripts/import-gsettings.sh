#!/bin/bash

# usage: import-gsettings
config="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini"
if [[ ! -f $config ]]; then exit 1; fi

gnome_schema="org.gnome.desktop.interface"

# shellcheck disable=SC2312
gtk_theme="$(grep 'gtk-theme-name' "$config" | sed 's/.*\s*=\s*//')"
# shellcheck disable=SC2312
icon_theme="$(grep 'gtk-icon-theme-name' "$config" | sed 's/.*\s*=\s*//')"
# shellcheck disable=SC2312
cursor_theme="$(grep 'gtk-cursor-theme-name' "$config" | sed 's/.*\s*=\s*//')"
# shellcheck disable=SC2312
font_name="$(grep 'gtk-font-name' "$config" | sed 's/.*\s*=\s*//')"

gsettings set "$gnome_schema" gtk-theme "$gtk_theme"
gsettings set "$gnome_schema" icon-theme "$icon_theme"
gsettings set "$gnome_schema" cursor-theme "$cursor_theme"
gsettings set "$gnome_schema" font-name "$font_name"
