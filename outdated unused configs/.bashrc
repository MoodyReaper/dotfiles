#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# bash/Prompt customization
PS1='[\u@\h \W]\$ '

# the --color=auto option enables color highlighting. Color codes are emitted only on standard output; not in pipes or redirection
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'

# suspends mv after eight seconds, asks for confirmation before overwriting any existing files, lists the operations in progress and does
# not store itself in the shell history file if the shell is configured to ignore space starting commands
alias mv='timeout 8 mv -iv'

# suspends rm after three seconds, asks confirmation to delete three or more files, lists the operations in progress, does not involve
# more than one file systems and does not store itself in the shell history file if the shell is configured to ignore space starting commands.
# Substitute -I with -i if you prefer to confirm even for one file
alias rm='timeout 3 rm -Iv --one-file-system'

# it is advisable that administrative users, as well as any other users that are authorized to use su (and it is suggested that there be very few,
# if any) acquire the habit of always running the su command with the -l/--login option
alias su="su -l"

# auto "cd" when entering just a path
shopt -s autocd

# Text edit command
alias edit=$EDITOR

export TERMINAL=alacritty
export VISUAL=code
export EDITOR=nano
export http_proxy=''
export https_proxy=''
export ftp_proxy=''
export socks_proxy=''

# Ruby
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Adding /bin executables path
export PATH="$HOME/.local/bin:$PATH"

# Python version management
# https://github.com/pyenv/pyenv
eval "$(pyenv init -)"

# https://github.com/swaywm/sway/wiki#issues-with-java-applications
if [ "$XDG_SESSION_DESKTOP" = "sway" ] || [ "$XDG_SESSION_TYPE" = "wayland" ]
then
    # https://wiki.archlinux.org/title/wayland#GUI_libraries
    # GTK
    export GDK_BACKEND=wayland
    # Clutter
    export CLUTTER_BACKEND=wayland
    # SDL2
    export SDL_VIDEODRIVER=wayland
    # QT
    export QT_QPA_PLATFORM=wayland
    export QT_QPA_PLATFORMTHEME=qt5ct
    # https://github.com/swaywm/sway/wiki#disabling-client-side-qt-decorations
    export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"

    # https://github.com/swaywm/sway/issues/595
    export _JAVA_AWT_WM_NONREPARENTING=1
    
    # https://github.com/swaywm/sway/wiki#i-cant-open-links-in-external-applications-in-firefox
    export MOZ_DBUS_REMOTE=1

    # https://github.com/Biont/sway-launcher-desktop#setup-a-terminal-command
    # export TERMINAL_COMMAND= $TERMINAL -e

    # https://github.com/swaywm/sway/wiki#i-have-a-multi-gpu-setup-like-intelnvidia-or-intelamd-and-sway-does-not-start
    # export WLR_DRM_DEVICES=/dev/dri/card0
    # TOREAD
    # https://github.com/swaywm/wlroots/issues/1923
fi

# Fish shell
if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]]
then
	exec fish
fi
