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

    ./programs/fish.nix
    ./programs/zsh.nix
    ./programs/starship.nix
    ./programs/atuin.nix

    ./programs/git.nix
    ./programs/bat.nix
    ./programs/eza.nix
    ./programs/rust.nix
  ];

  xdg.enable = true;

  catppuccin.flavour = "frappe";

  home.stateVersion = "23.05";
}
