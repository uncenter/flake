{inputs, ...}: {
  programs.home-manager.enable = true;

  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin

    ./variables.nix
    ./fonts.nix
	./packages.nix

    ./apps

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
    ./programs/neovim.nix
    ./programs/nix-init.nix
    ./programs/python.nix
    ./programs/rust.nix
    ./programs/spicetify.nix
    ./programs/starship.nix
    ./programs/yazi.nix

    ./scripts.nix
  ];

  xdg.enable = true;
  fonts.fontconfig.enable = true;

  catppuccin = {
    flavor = "macchiato";
    accent = "blue";
  };

  home.stateVersion = "23.05";
}
