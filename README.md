<div align="center">
    <img src=".github/assets/nix.svg" width="100">
    <h1>flake</h1>
    <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" />
</div>

## Structure

- `home/apps/*` - configuration for GUI applications.
- `home/programs/*.nix` - configuration for CLI programs.
- `home/scripts/*.sh` & `home/scripts.nix` - custom symlinked shell scripts.
- `home/variables.nix` - environment variables.
- `icons/*.ico` - custom app icons for GUI applications.
- `modules/packages.nix` & `modules/homebrew.nix` - packages from [Nixpkgs](https://github.com/NixOS/nixpkgs) and [Homebrew](https://brew.sh/), respectively.

## Credits

Many thanks to [ryanccn/flake](https://github.com/ryanccn/flake), [isabelroses/dotfiles](https://github.com/isabelroses/dotfiles), and [nix-darwin-kickstarter](https://github.com/ryan4yin/nix-darwin-kickstarter) for inspiring and serving as the foundation for this configuration.

## License

[Apache 2.0](LICENSE)
