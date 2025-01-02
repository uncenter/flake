{
  lib,
  self,
  inputs,
  ...
}:
{
  easyHosts = {
    shared.modules = [
      ../users
      ../modules/shared
    ];

    perClass = class: {
      modules = [
        "${self}/modules/${class}"

        (lib.optionals (class == "nixos") [
          inputs.nixos-wsl.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
        ])

        (lib.optionals (class == "darwin") [
          inputs.home-manager.darwinModules.home-manager
          inputs.darwin-custom-icons.darwinModules.default
        ])
      ];

    };

    hosts = {
      azula = {
        arch = "x86_64";
        class = "nixos";
      };

      katara = {
        arch = "aarch64";
        class = "darwin";
      };
    };
  };
}
