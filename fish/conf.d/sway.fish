# Run only on login
if status --is-login

    # If running from tty1 set Wayland environment variables and start Sway
    #set TTY1 (tty)
    #if [ "$TTY1" = /dev/tty1 ]
    #    # Set Wayland/Sway ENV variables
    #    env-variables-wayland-sway
    #    # Sway start
    #    # https://github.com/swaywm/sway/wiki#login-managers
    #    exec sway
    #end

    # Check if ENV variable exists
    if test -n "$XDG_SESSION_TYPE"
        # If Wayland/Sway is chosen in Login Manager:
        if [ $XDG_SESSION_TYPE = wayland ]
            # Set Wayland/Sway ENV variables
            env-variables-wayland-sway
        end
    end

end
