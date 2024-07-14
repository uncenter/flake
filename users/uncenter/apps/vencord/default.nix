{
  config,
  lib,
  pkgs,
  ...
}:
let
  mkLink = config.lib.file.mkOutOfStoreSymlink;

  flakeDir = "${config.home.homeDirectory}/.config/flake/users/uncenter/apps/vencord";
  settingsFile = mkLink "${flakeDir}/settings.json";
  cssFile = mkLink "${flakeDir}/quickCss.css";
in
{
  home.file =
    let
      common = "Library/Application Support/Vencord/settings";
    in
    lib.mkIf pkgs.stdenv.isDarwin {
      "${common}/settings.json".source = settingsFile;
      "${common}/quickCss.css".source = cssFile;
    };
}
