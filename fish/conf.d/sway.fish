# Run only on login
if status --is-login

    # If running from tty3 set Wayland environment variables and start Sway
    # Used as a fallback in case of broken login manager
    set TTY3 (tty)
    if [ "$TTY3" = /dev/tty3 ]
        # Set Wayland/Sway ENV variables
        env-variables-wayland-sway
        # Sway start
        # https://github.com/swaywm/sway/wiki#login-managers
        exec sway
    end

    # Check if ENV variable exists
    if test -n "$XDG_SESSION_TYPE"
        # If Wayland/Sway is chosen in Login Manager:
        if [ $XDG_SESSION_TYPE = wayland ]
            # Set Wayland/Sway ENV variables
            env-variables-wayland-sway
        end
    end

end
