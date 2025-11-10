# Bootstrapping

## macOS

1. Install Nix using https://github.com/DeterminateSystems/nix-installer#determinate-nix-installer, **avoid Determinate Nix**.
2. Install Homebrew with `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`.
3. Install, run, and switch with nix-darwin using `sudo nix run nix-darwin/nix-darwin-25.05#darwin-rebuild -- switch --flake github:uncenter/flake#katara`.
4. Edit `/etc/shells` to add `/run/current-system/sw/bin/fish` on the last line, then run `chsh -s /run/current-system/sw/bin/fish`.
