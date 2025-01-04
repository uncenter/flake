{
  lib,
  self,
  inputs,
  ...
}:
{
  imports = [ inputs.easy-hosts.flakeModule ];

  easyHosts = {
    shared.modules = [
      ../users
      ../modules/shared
    ];

    additionalClasses = {
      wsl = "nixos";
    };

    perClass = class: {
      modules = [
        "${self}/modules/${class}"

        (lib.optionals (class == "nixos" || class == "wsl") [
          inputs.home-manager.nixosModules.home-manager
        ])

        (lib.optionals (class == "darwin") [
          inputs.home-manager.darwinModules.home-manager
          inputs.darwin-custom-icons.darwinModules.default
        ])

        (lib.optionals (class == "wsl") [
          inputs.nixos-wsl.nixosModules.default
        ])
      ];
    };

    hosts = {
      azula = {
        arch = "x86_64";
        class = "wsl";
      };

      katara = {
        arch = "aarch64";
        class = "darwin";
      };
    };
  };
}
