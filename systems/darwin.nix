{ inputs, ... }:
{
  flake = {
    darwinConfigurations = {
      Katara = inputs.nix-darwin.lib.darwinSystem {
        modules = [
          inputs.home-manager.darwinModules.home-manager
          inputs.darwin-custom-icons.darwinModules.default
          ./katara
          ../users
          ../modules/shared
          ../modules/darwin
        ];

        specialArgs = {
          inherit inputs;
        };
      };
    };
  };
}
