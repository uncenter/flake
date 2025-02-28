{
  programs.home-manager.enable = true;

  imports = [
    ./catppuccin.nix
    ./variables.nix
    ./fonts.nix
    ./packages.nix
    ./scripts.nix

    ./apps
    ./programs
    ./tooling
    ./shells
  ];

  xdg.enable = true;
  fonts.fontconfig.enable = true;
}
