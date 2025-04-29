{
  pkgs,
  config,
  lib,
  ...
}:
let
  tomlFormat = pkgs.formats.toml { };
  mkUpper =
    str:
    (lib.toUpper (builtins.substring 0 1 str)) + (builtins.substring 1 (builtins.stringLength str) str);

  ctpTelevision = pkgs.fetchFromGitHub {
    owner = "uncenter";
    repo = "ctp-television";
    rev = "d6e220549893070a155e13794b6a8984c7126457";
    hash = "sha256-5EDRDBbdTIzVJoRvyOrLxdlyX9Z2xJzS3yvOFBijLI4=";
  };
  themeName = "catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}.toml";
in
{
  xdg.configFile = {
    "television/themes/${themeName}".source = "${ctpTelevision}/themes/${themeName}";
    "television/config.toml" = {
      source = tomlFormat.generate "config.toml" {
        ui = {
          theme = themeName;
        };
        previewers.file.theme = "Catppuccin ${mkUpper config.catppuccin.flavor}";
      };
    };
  };
}
