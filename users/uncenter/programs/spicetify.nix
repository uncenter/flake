{
  lib,
  config,
  inputs,
  inputs',
  osConfig,
  ...
}:
let
  spicePkgs = inputs'.spicetify-nix.legacyPackages;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify = lib.mkIf osConfig.glade.programs.media.enable {
    enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = config.catppuccin.flavor;
  };
}
