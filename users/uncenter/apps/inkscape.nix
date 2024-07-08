{pkgs, ...}: let
  palette = pkgs.fetchzip {
    url = "https://github.com/catppuccin/palette/releases/download/v1.1.1/catppuccin.zip";
    sha256 = "jLwJfUy38An7JsieXKOvTcmMYaY2nrjvJovkjofi9zs=";
    stripRoot = false;
  };
in {
  home.file."Library/Application Support/org.inkscape.Inkscape/config/inkscape/palettes" = {
    source = "${palette}/gimp";
    recursive = true;
  };
}
