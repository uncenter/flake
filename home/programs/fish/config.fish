/opt/homebrew/bin/brew shellenv | source

# https://fishshell.com/docs/current/cmds/fish_add_path.html

fish_add_path -Pm /etc/profiles/per-user/$USER/bin /run/current-system/sw/bin
fish_add_path $GOPATH/bin
fish_add_path $CARGO_HOME/bin
fish_add_path $PNPM_HOME
fish_add_path $HOME/.local/bin

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

starship init fish | source
fnm env | source
atuin init fish | source

# https://fishshell.com/docs/current/cmds/fish_greeting.html
set fish_greeting
