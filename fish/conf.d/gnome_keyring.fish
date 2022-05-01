# Run only on login
if status --is-login
    # https://wiki.archlinux.org/title/GNOME/Keyring#Shell
    set -x (gnome-keyring-daemon --start | string split "=")
end
