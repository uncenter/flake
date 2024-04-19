{
  imports = [../../modules/extra/home-manager/silicon.nix];
  config.programs.silicon = {
    enable = true;

    font = "CommitMono Nerd Font";
    theme = "Catppuccin Frappe";
  };
}
