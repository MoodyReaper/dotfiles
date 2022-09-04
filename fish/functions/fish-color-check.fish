function fish-color-check -d "Show fish shell configured colors"
    argparse \
        -x 'v,h,p' \
        'v/version' 'h/help' \
        'p/print' \
        -- $argv
    or return 1

    set --local version_fish_color "v0.2.0"
    # color set
    set --local ce (set_color $fish_color_error)
    set --local cn (set_color $fish_color_normal)

    set --local sample_text $argv

    if set -q _flag_version
        echo "version: " $version_fish_color
        return
    else if set -q _flag_help
        __fish-color-check_help
        return
    else if set -q _flag_print
        # echo "-->prints a list of the 16 named colors"$cn
        set_color --print-colors
        return
    else if set -q _flag_test
        # check universal colors
        set -U | command grep fish_color
        return
    else if set -q _flag_debug
        echo $ce"No debug process found"
        return 1
    else
        # main process
        # echo "-->Show the list of shell colors"$cn
        # all the color variables: https://fishshell.com/docs/current/interactive.html?highlight=pager_color#syntax-highlighting-variables
        set --local first_grep_list (string split -n " " (set -U | command grep 'fish.*_color'))
        set --local matched (string match -- 'fish*_color_*' $first_grep_list)
        set --local match_index
        set --local full (count $matched)
        
        for i in (seq 1 (count $matched))
            set -a match_index (contains --index $matched[$i] $first_grep_list)
        end

        for i in (seq 1 (count $match_index))
            set -l num_prep (math $match_index[(math $i "+" 1)] "-" 1)
            set color_set_$i $first_grep_list[$match_index[$i]..$num_prep]
            set -l color_prep color_set_$i
        end

        for i in (seq 1 $full)
            set -l color_set_string color_set_$i
            set -l color_set_element (string split " " -- $$color_set_string)
            set -l color_name $color_set_element[1]

            set -l color_value_prep $color_set_element[2..-1]
            set -l color_value (string trim -c "'" -- $color_value_prep )

            if test -n "$sample_text"
                echo $color_name (set_color $color_value) $color_value "\"$sample_text\"" $cn
            else
                echo $color_name (set_color $color_value) $color_value $cn
            end
        end
    end
end


function __fish-color-check_help
    echo "USAGE:"
    echo "      fish-color-check [OPTION]"
    echo "      fish-color-check [SAMPLETEXT]"
    echo "OPTIONS:"
    echo "      -v, --version     Show version info"
    echo "      -h, --help        Show help"
    echo "      -p, --print       Show a list of the 16 named colors"
end

