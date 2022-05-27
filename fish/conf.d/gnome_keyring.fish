# Yes, it is horrible
# But "set -x (gnome-keyring-daemon --start | string split "=")" mentioned in https://wiki.archlinux.org/title/GNOME/Keyring#Shell
# doesn't work as intended because it creates only one ENV variable: "GNOME_KEYRING_CONTROL=/run/user/1000/keyring SSH_AUTH_SOCK /run/user/1000/keyring/ssh"

# Run only on login
if status --is-login
    set ENV_VARIABLES (gnome-keyring-daemon --start | string split " ")
    for ENV_VARIABLE in $ENV_VARIABLES
        set -x (echo $ENV_VARIABLE | string split "=")
    end
end
