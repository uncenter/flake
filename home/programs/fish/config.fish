/opt/homebrew/bin/brew shellenv | source
pyenv init - | source

set -gx PATH $PYENV_ROOT/bin (brew --prefix ccache)/libexec $GOPATH/bin $CARGO_HOME/bin $PNPM_HOME $XDG_BIN_HOME $XDG_SCRIPT_DIR /opt/homebrew/opt/openjdk/bin $PATH

starship init fish | source
fnm env | source
atuin init fish | source
zoxide init fish | source
source ~/.config/tabtab/fish/__tabtab.fish
source /Users/uncenter/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
