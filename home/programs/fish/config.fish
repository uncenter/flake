/opt/homebrew/bin/brew shellenv | source

fish_add_path -Pm /etc/profiles/per-user/$USER/bin /run/current-system/sw/bin

fish_add_path $GOPATH/bin
fish_add_path $CARGO_HOME/bin
fish_add_path $PNPM_HOME
fish_add_path $XDG_BIN_HOME
fish_add_path $XDG_SCRIPT_DIR

starship init fish | source
fnm env | source
atuin init fish | source

set fish_greeting
