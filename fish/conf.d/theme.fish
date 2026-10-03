if status is-interactive
    # flavours shares theme changes through universal variables.
    # Remove default globals so they do not shadow the shared colors.
    set -l color
    for color in (set --names | string match --entire --regex '^fish_(?:pager_)?color_')
        set --erase --global "$color"
        or true
    end
    base16-fish
end
