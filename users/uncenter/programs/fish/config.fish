# https://fishshell.com/docs/current/cmds/fish_add_path.html

fish_add_path -Pm /etc/profiles/per-user/$USER/bin /run/wrappers/bin /run/current-system/sw/bin
fish_add_path $GOPATH/bin
fish_add_path $CARGO_HOME/bin
fish_add_path $PNPM_HOME

# Ghostty supports auto-injection but nix-darwin hard overwrites XDG_DATA_DIRS
# which make it so that we can't use the auto-injection. We have to source
# manually. From https://github.com/mitchellh/nixos-config/blob/74ede9378860d4807780eac80c5d685e334d59e9/users/mitchellh/config.fish#L43-L51.
if set -q GHOSTTY_RESOURCES_DIR
    source "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
end

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
