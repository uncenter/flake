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
    ./programs/bottom.nix
    ./programs/eza.nix
    ./programs/fd.nix
    ./programs/fish.nix
    ./programs/fzf.nix
    ./programs/git.nix
    ./programs/glamour.nix
    ./programs/izrss.nix
    ./programs/lazygit.nix
    ./programs/rust.nix
    ./programs/starship.nix
    ./programs/yazi.nix

    ./scripts.nix
  ];

  xdg.enable = true;

  catppuccin.flavour = "frappe";
  catppuccin.accent = "mauve";

  home.stateVersion = "23.05";
}
