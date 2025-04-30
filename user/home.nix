{
  programs.home-manager.enable = true;

  imports = [
    ./catppuccin.nix

    ./apps
    ./programs
    ./scripts
    ./shells
    ./system
    ./tooling
  ];

  xdg.enable = true;
  fonts.fontconfig.enable = true;
}
