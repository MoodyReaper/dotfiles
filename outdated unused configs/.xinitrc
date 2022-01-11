#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# changing keyboard layout on pressing CapsLock
setxkbmap -layout "us,ru" -option "grp:caps_toggle"

# terminating X-server on Ctrl+Alt+Bksp
setxkbmap -option "terminate:ctrl_alt_bksp"

# An interactive switch between gvim under X or nano
export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'gedit'; else echo 'nano'; fi)"

# BROWSER contains the path to the web browser. Helpful to set in an interactive shell configuration file 
# so that it may be dynamically altered depending on the availability of a graphic environment, such as X
if [ -n "$DISPLAY" ]; then
    export BROWSER=firefox
else 
    export BROWSER=links
fi

# Launch i3 window manager
# https://samsaffron.com/archive/2019/04/09/my-i3-window-manager-setup
eval $(dbus-launch -sh-syntax --exit-with-session)
dbus-update-activation-environment --systemd DISPLAY

xrdb -merge ~/.Xresources

# Disable DPMS and prevent screen from blanking
xset dpms 0 0 0
xset s off -dpms

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

exec sway
