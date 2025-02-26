{
  lib,
  self,
  inputs,
  ...
}:
let
  additionalClasses = {
    wsl = "nixos";
  };

  normaliseClass = class: additionalClasses.${class} or class;
in
{
  imports = [ inputs.easy-hosts.flakeModule ];

  easy-hosts = {
    shared.modules = [
      ../users
      ../modules/shared
    ];

    inherit additionalClasses;

    perClass =
      class:
      let
        normalisedClass = normaliseClass class;
      in
      {
        modules = builtins.concatLists [
          [
            "${self}/modules/${normalisedClass}"
          ]

          (lib.optionals (normalisedClass == "nixos") [
            inputs.home-manager.nixosModules.home-manager
            inputs.tgirlpkgs.nixosModules.default
          ])

          (lib.optionals (class == "darwin") [
            inputs.home-manager.darwinModules.home-manager
            inputs.tgirlpkgs.darwinModules.default
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
