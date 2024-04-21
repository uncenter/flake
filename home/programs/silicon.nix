{self, ...}: {
  imports = [self.homeManagerModules.silicon];
  config.programs.silicon = {
    enable = true;

    font = "CommitMono Nerd Font";
    theme = "Catppuccin Frappe";
  };
}
