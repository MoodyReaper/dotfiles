function base16-fish --description 'Applies base16 colors for Fish shell'
    # Start flavours
    ## Base16 tender
    # Author: Jacobo Tabernero (https://github/com/jacoborus/tender.vim)

    # Reference: https://github.com/FabioAntunes/base16-fish-shell/blob/main/templates/default.mustache

    # Fish syntax highlighting
    # https://fishshell.com/docs/current/interactive.html#syntax-highlighting

    set -U fish_color_autosuggestion b8b8b8 brblack
    set -U fish_color_cancel -r
    set -U fish_color_command b3deef blue --bold
    set -U fish_color_comment b8b8b8 brblack
    set -U fish_color_cwd c9d05c green
    # "fish_color_cwd_root" - did not find in doc for some reason
    set -U fish_color_cwd_root f43753 red
    set -U fish_color_end 73cef4 cyan
    set -U fish_color_error f43753 red --bold
    set -U fish_color_escape 73cef4 cyan
    # "fish_color_history_current" - did not find in doc for some reason
    set -U fish_color_history_current --bold
    set -U fish_color_host normal
    set -U fish_color_host_remote yellow
    # "fish_color_keyword" - keywords like if - this falls back on the command color if unset
    # set -U fish_color_keyword ??
    # "fish_color_match" - did not find in doc for some reason
    set -U fish_color_match --background=brblue
    set -U fish_color_normal normal
    set -U fish_color_operator 73cef4 cyan
    set -U fish_color_param e8e8e8 cyan
    set -U fish_color_quote c9d05c green
    set -U fish_color_redirection ffc24b yellow
    set -U fish_color_search_match ffc24b bryellow --background=brblack
    set -U fish_color_selection eeeeee white --bold --background=brblack
    # "fish_color_status" - did not find in doc for some reason
    set -U fish_color_status f43753 red
    set -U fish_color_user c9d05c brgreen
    # "fish_color_valid_path" - did not find in doc for some reason
    set -U fish_color_valid_path --underline

    set -U fish_pager_color_completion normal
    set -U fish_pager_color_description ffc24b yellow
    set -U fish_pager_color_prefix eeeeee white --bold --underline
    set -U fish_pager_color_progress feffff brwhite --background=cyan
    set -U fish_pager_color_selected_background -r

    set -U base16_fish_theme tender
    # End flavours
end
