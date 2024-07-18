{ inputs, ... }:
{
  flake = {
    nixosConfigurations = {
      azula = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          inputs.nixos-wsl.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
          ./azula
          ../users
          ../modules/shared
          ../modules/nixos
        ];

        specialArgs = {
          inherit inputs;
        };
      };
    };
  };
}
