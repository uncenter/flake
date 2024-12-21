{ pkgs, lib, ... }:
let
  palettes = pkgs.fetchzip {
    url = "https://github.com/catppuccin/palette/releases/download/v1.7.1/catppuccin.zip";
    sha256 = "sha256-yj8jX4k2MMoHgBP3j4ptL3nZmsoYdkesXDJqgyZwN08=";
    stripRoot = false;
  };
in
{
  home.file = lib.mkIf pkgs.stdenv.isDarwin {
    "Library/Application Support/org.inkscape.Inkscape/config/inkscape/palettes" = {
      source = "${palettes}/gimp";
      recursive = true;
    };
    "Library/Colors" = {
      source = "${palettes}/clr";
      recursive = true;
    };
  };
}
