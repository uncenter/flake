{self, ...}: {
  imports = [self.homeManagerModules.nix-init];
  config.programs.nix-init = {
    enable = true;

    settings = {
      maintainers = [
        "uncenter"
      ];
    };
  };
}
