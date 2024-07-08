{inputs, ...}: {
  flake = {
    darwinConfigurations = {
      katara = inputs.nix-darwin.lib.darwinSystem {
        modules = [
          inputs.home-manager.darwinModules.home-manager
          inputs.darwin-custom-icons.darwinModules.default
          ./katara
        ];
      };
    };
  };
}
