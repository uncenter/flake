{
  inputs,
  nixpkgs,
  nixos-wsl,
  ...
}:
{
  flake = {
    nixosConfigurations = {
      azula = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.default
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
