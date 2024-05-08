{self, ...}: {
  imports = [self.homeManagerModules.silicon];
  config.programs.silicon = {
    enable = true;

    settings = {
      font = "CommitMono Nerd Font";
      theme = "Catppuccin Frappe";
      line-number = false;
      window-controls = true;
    };
  };
}
