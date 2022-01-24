# Run only on login
if status --is-login
    # If running from tty1 set Wayland environment variables and start Sway
    set TTY1 (tty)
    if [ "$TTY1" = "/dev/tty1" ]
        # https://github.com/swaywm/sway/wiki/Running-programs-natively-under-wayland
        # https://wiki.archlinux.org/title/wayland#GUI_libraries
        # GTK
        set -gx GDK_BACKEND wayland
        # Clutter
        set -gx CLUTTER_BACKEND wayland
        # SDL2
        set -gx SDL_VIDEODRIVER wayland
        # QT
        set -gx QT_QPA_PLATFORM wayland
        set -gx QT_QPA_PLATFORMTHEME qt5ct
        # https://github.com/swaywm/sway/wiki#disabling-client-side-qt-decorations
        set -gx QT_WAYLAND_DISABLE_WINDOWDECORATION "1"
        # Elementary/EFL
        # You could set them to wayland_shm instead, if you want to use software rendering
        set -gx ECORE_EVAS_ENGINE wayland_egl
        set -gx ELM_ENGINE wayland_egl

        # Java
        # Some Java AWT applications will not display properly unless you set the following.
        # https://github.com/swaywm/sway/wiki/Running-programs-natively-under-wayland#java-under-xwayland
        # https://github.com/swaywm/sway/issues/595
        set -gx _JAVA_AWT_WM_NONREPARENTING 1

        # Firefox
        # https://github.com/swaywm/sway/wiki#i-cant-open-links-in-external-applications-in-firefox
        set -gx MOZ_DBUS_REMOTE 1
        # https://wiki.archlinux.org/title/firefox#Wayland
        set -gx MOZ_ENABLE_WAYLAND 1

        # https://github.com/Biont/sway-launcher-desktop#setup-a-terminal-command
        set -gx TERMINAL alacritty
        # set -gx TERMINAL_COMMAND "$TERM -e"

        # https://github.com/swaywm/sway/wiki#i-have-a-multi-gpu-setup-like-intelnvidia-or-intelamd-and-sway-does-not-start
        # set -gx WLR_DRM_DEVICES /dev/dri/card1
        # TOREAD
        # https://github.com/swaywm/wlroots/issues/1923

        # https://wiki.archlinux.org/title/PipeWire#xdg-desktop-portal-wlr
        set -gx XDG_CURRENT_DESKTOP sway

        # Sway start
        # https://github.com/swaywm/sway/wiki#login-managers
        exec sway
    end
end
