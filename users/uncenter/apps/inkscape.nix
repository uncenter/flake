{ lib, pkgs, ... }:
{
  home.file = lib.mkIf pkgs.stdenv.isDarwin {
    "Library/Application Support/org.inkscape.Inkscape/config/inkscape/palettes" = {
      source = "${
        pkgs.fetchzip {
          url = "https://github.com/catppuccin/palette/releases/download/v1.1.1/catppuccin.zip";
          sha256 = "jLwJfUy38An7JsieXKOvTcmMYaY2nrjvJovkjofi9zs=";
          stripRoot = false;
        }
      }/gimp";
      recursive = true;
    };
  };
}
