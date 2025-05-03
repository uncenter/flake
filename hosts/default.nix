{
  lib,
  self,
  inputs,
  ...
}:
let
  additionalClasses = {
    wsl = "nixos";
    raspberry-pi = "nixos";
  };

  normaliseClass = class: additionalClasses.${class} or class;

  # for some reason, the hash of atf is ... wrong in nixpkgs?
  # see https://github.com/NixOS/nixpkgs/issues/399767
  # this overlay just uses the "correct" hash, verifiable by running
  # `nix run nixpkgs#nix-prefetch-git -- https://github.com/freebsd/atf --rev atf-0.22 2>/dev/null | grep hash`
  fixAtfHash =
    { ... }:
    {
      nixpkgs.overlays = [
        (final: prev: {
          atf =
            assert prev.lib.asserts.assertMsg (prev.atf.version == "0.22")
              "ATF version changed - this hack is built for 0.22, but got ${prev.atf.version}. Consider removing this hack.";

            prev.atf.overrideAttrs (oldAttrs: {
              src = prev.fetchFromGitHub {
                owner = "freebsd";
                repo = "atf";
                tag = "atf-0.22";
                hash = "sha256-Uvi2/iZM1AfmBX+05fzNUlfSBSrGw0c3SE1qKyLa2Zo=";
              };
            });
        })
      ];
    };
in
{
  imports = [ inputs.easy-hosts.flakeModule ];

  easy-hosts = {
    shared.modules = [
      ../user
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
            fixAtfHash
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

      zuko = {
        arch = "aarch64";
        class = "raspberry-pi";
      };
    };
  };
}
