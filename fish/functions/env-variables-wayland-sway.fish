function env-variables-wayland-sway --description 'Applies ENV variables for Wayland session'
    # https://github.com/swaywm/sway/wiki/Running-programs-natively-under-wayland
    # https://wiki.archlinux.org/title/wayland#GUI_libraries

    # GTK
    set -gx GDK_BACKEND wayland

    # Clutter
    set -gx CLUTTER_BACKEND wayland

    # SDL2
    set -gx SDL_VIDEODRIVER 'wayland,x11'

    # QT
    set -gx QT_QPA_PLATFORM 'wayland;xcb'
    set -gx QT_QPA_PLATFORMTHEME qt5ct
    # https://github.com/swaywm/sway/wiki#disabling-client-side-qt-decorations
    set -gx QT_WAYLAND_DISABLE_WINDOWDECORATION 1

    # Java
    # Some Java AWT applications will not display properly unless you set the following
    # https://github.com/swaywm/sway/wiki/Running-programs-natively-under-wayland#java-under-xwayland
    # https://github.com/swaywm/sway/issues/595
    set -gx _JAVA_AWT_WM_NONREPARENTING 1

    # Firefox
    # https://github.com/swaywm/sway/wiki#i-cant-open-links-in-external-applications-in-firefox
    set -gx MOZ_DBUS_REMOTE 1
    # https://wiki.archlinux.org/title/firefox#Wayland
    set -gx MOZ_ENABLE_WAYLAND 1

    # Terminal
    # https://github.com/Biont/sway-launcher-desktop#setup-a-terminal-command
    set -gx TERMINAL alacritty
    # set -gx TERMINAL_COMMAND "$TERM -e"

    # XDG Desktop
    # https://wiki.archlinux.org/title/PipeWire#xdg-desktop-portal-wlr
    set -gx XDG_CURRENT_DESKTOP sway
end
