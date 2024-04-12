{
  config,
  inputs,
  ...
}: {
  programs.home-manager.enable = true;

  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin

    ./variables.nix
    ./fonts.nix

    ./apps/vscode.nix
    ./apps/ghostty.nix

    ./programs/atuin.nix
    ./programs/bat.nix
    ./programs/eza.nix
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/newsboat.nix
    ./programs/rust.nix
    ./programs/starship.nix
    ./programs/yazi.nix
  ];

  xdg.enable = true;

  catppuccin.flavour = "frappe";
  catppuccin.accent = "mauve";

  home.stateVersion = "23.05";
}
