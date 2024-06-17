{config, ...}: let
  mkLink = config.lib.file.mkOutOfStoreSymlink;

  flakeDir = "/Users/uncenter/.config/flake/home/apps/vencord";
  settingsFile = mkLink "${flakeDir}/settings.json";
  cssFile = mkLink "${flakeDir}/quickCss.json";
in {
  home.file = let
    common = "Library/Application Support/Vencord/settings";
  in {
    "${common}/settings.json".source = ./settings.json;
    "${common}/quickCss.css".source = ./quickCss.css;
  };
}
