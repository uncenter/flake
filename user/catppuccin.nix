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
    inputs.catppuccin.homeModules.catppuccin
  ];

  options.palette = mkOption {
    type = types.attrs;
  };

  config = {
    catppuccin = {
      flavor = "mocha";
      accent = "mauve";
      enable = true;
    };

    home.packages = mkIf config.catppuccin.enable [
      inputs'.tgirlpkgs.packages.purr
      inputs'.catppuccin.packages.whiskers
      inputs'.catppuccin.packages.catwalk
    ];

    palette = lib.importJSON (config.catppuccin.sources.palette + "/palette.json");
  };
}
