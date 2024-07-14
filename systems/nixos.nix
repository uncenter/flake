{ inputs, nixos-wsl, ... }:
{
  flake = {
    nixosConfigurations = {
      azula = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          inputs.nixos-wsl.nixosModules.default
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
