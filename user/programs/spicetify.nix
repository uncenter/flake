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

  programs.spicetify = lib.mkIf osConfig.glade.apps.enable {
    enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = config.catppuccin.flavor;
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      copyToClipboard
    ];
  };
}
