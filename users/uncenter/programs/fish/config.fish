function newlinefix --on-event fish_prompt
    if test -z "$NEW_LINE_BEFORE_PROMPT"
        set -gx NEW_LINE_BEFORE_PROMPT 1
    else if test "$NEW_LINE_BEFORE_PROMPT" -eq 1
        echo
    end
end
function clear
    set -gx NEW_LINE_BEFORE_PROMPT
    command clear
end
function reset
    set -gx NEW_LINE_BEFORE_PROMPT
    command reset
end

fnm env --use-on-cd | source
luarocks path --bin | source
nix-your-shell fish | source

# https://fishshell.com/docs/current/cmds/fish_greeting.html
set fish_greeting
