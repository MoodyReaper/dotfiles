function base16-fish --description 'Applies base16 colors for Fish shell'
    # Start flavours
        ## Base16 Dracula
        # Author: Mike Barkmin (http://github.com/mikebarkmin) based on Dracula Theme (http://github.com/dracula)

        # Reference: https://github.com/FabioAntunes/base16-fish-shell/blob/main/templates/default.mustache

        # Fish syntax highlighting
        # https://fishshell.com/docs/current/interactive.html#syntax-highlighting

        set -U fish_color_autosuggestion '626483' brblack
        set -U fish_color_cancel -r
        set -U fish_color_command '62d6e8' blue --bold
        set -U fish_color_comment '626483' brblack
        set -U fish_color_cwd 'ebff87' green
        # "fish_color_cwd_root" - did not find in doc for some reason
        set -U fish_color_cwd_root 'ea51b2' red
        set -U fish_color_end 'a1efe4' cyan
        set -U fish_color_error 'ea51b2' red --bold
        set -U fish_color_escape 'a1efe4' cyan
        # "fish_color_history_current" - did not find in doc for some reason
        set -U fish_color_history_current --bold
        set -U fish_color_host normal
        set -U fish_color_host_remote yellow
        # "fish_color_keyword" - keywords like if - this falls back on the command color if unset
        # set -U fish_color_keyword ??
        # "fish_color_match" - did not find in doc for some reason
        set -U fish_color_match --background=brblue
        set -U fish_color_normal normal
        set -U fish_color_operator 'a1efe4' cyan
        set -U fish_color_param 'f1f2f8' cyan
        set -U fish_color_quote 'ebff87' green
        set -U fish_color_redirection '00f769' yellow
        set -U fish_color_search_match '00f769' bryellow --background=brblack
        set -U fish_color_selection 'e9e9f4' white --bold --background=brblack
        # "fish_color_status" - did not find in doc for some reason
        set -U fish_color_status 'ea51b2' red
        set -U fish_color_user 'ebff87' brgreen
        # "fish_color_valid_path" - did not find in doc for some reason
        set -U fish_color_valid_path --underline

        set -U fish_pager_color_completion normal
        set -U fish_pager_color_description '00f769' yellow
        set -U fish_pager_color_prefix 'e9e9f4' white --bold --underline
        set -U fish_pager_color_progress 'f7f7fb' brwhite --background=cyan

        set -U base16_fish_theme dracula
    # End flavours
end
