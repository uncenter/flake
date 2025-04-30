{
  lib,
  config,
  inputs,
  inputs',
  ...
}:
let
  inherit (lib) mkOption types mkIf;
in
{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  options.palette = mkOption {
    type = types.attrs;
  };

  config = {
    catppuccin = {
      enable = true;

      flavor = "mocha";
      accent = "mauve";

      cache.enable = true;
    };

    home.packages = mkIf config.catppuccin.enable [
      inputs'.tgirlpkgs.packages.purr
      inputs'.catppuccin.packages.whiskers
      inputs'.catppuccin.packages.catwalk
    ];

    palette = lib.importJSON (config.catppuccin.sources.palette + "/palette.json");
  };
}
