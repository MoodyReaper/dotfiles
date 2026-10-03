# Usage: load-env .env
# Supports NAME=value, optional export, whitespace, empty values, and whole-value
# single/double quotes. Unquoted inline comments require whitespace before #.
# Values are literal: no expansion, escape decoding, or multiline values.
# All lines are validated before exporting into the current shell.
function load-env -d "Load literal environment assignments from a file"
    if test (count $argv) -ne 1
        printf 'Usage: load-env FILE\n' >&2
        return 2
    end

    set -l file "$argv[1]"
    if not test -f "$file"; or not test -r "$file"
        printf 'load-env: cannot read file: %s\n' "$file" >&2
        return 1
    end

    set -l names
    set -l values
    set -l line_number 0
    begin
        while true
            read --local --line line
            set -l read_status $status
            if test $read_status -gt 1
                printf 'load-env: failed reading file: %s\n' "$file" >&2
                return 1
            end
            if test $read_status -eq 1; and test -z "$line"
                break
            end

            set line_number (math $line_number + 1)
            set line "$(string replace -r '\r$' '' -- "$line")"
            if string match -qr '^[ \t]*(#.*)?$' -- "$line"
                continue
            end

            # Declare named regex captures locally to avoid modifying globals.
            set -l env_name ''
            set -l env_value ''
            if not string match -qr '^[ \t]*(?:export[ \t]+)?(?<env_name>[A-Za-z_][A-Za-z0-9_]*)[ \t]*=(?<env_value>.*)$' -- "$line"
                printf 'load-env: %s:%s: invalid assignment\n' "$file" $line_number >&2
                return 1
            end

            set -l trimmed "$(string trim -- "$env_value")"
            if string match -q '"*' -- "$trimmed"
                if not string match -qr '^"(?<env_value>[^"]*)"[ \t]*(?:#.*)?$' -- "$trimmed"
                    printf 'load-env: %s:%s: invalid double-quoted value\n' "$file" $line_number >&2
                    return 1
                end
            else if string match -q "'*" -- "$trimmed"
                if not string match -qr "^'(?<env_value>[^']*)'[ \t]*(?:#.*)?\$" -- "$trimmed"
                    printf 'load-env: %s:%s: invalid single-quoted value\n' "$file" $line_number >&2
                    return 1
                end
            else
                set env_value "$(string replace -r '[ \t]+#.*$' '' -- "$env_value")"
                set env_value "$(string trim -- "$env_value")"
                if string match -qr "[\"']" -- "$env_value"
                    printf 'load-env: %s:%s: quotes must surround the whole value\n' "$file" $line_number >&2
                    return 1
                end
            end

            set -a names "$env_name"
            set -a values "$env_value"
        end
    end <"$file"
    or return 1

    set -l index
    for index in (seq (count $names))
        if not set -gx -- "$names[$index]" "$values[$index]" 2>/dev/null
            printf 'load-env: cannot export variable: %s\n' "$names[$index]" >&2
            return 1
        end
    end
    return 0
end
