{config, ...}: let
  mkLink = config.lib.file.mkOutOfStoreSymlink;

  flakeDir = "/Users/uncenter/.config/flake/users/uncenter/apps/vencord";
  settingsFile = mkLink "${flakeDir}/settings.json";
  cssFile = mkLink "${flakeDir}/quickCss.css";
in {
  home.file = let
    common = "Library/Application Support/Vencord/settings";
  in {
    "${common}/settings.json".source = settingsFile;
    "${common}/quickCss.css".source = cssFile;
  };
}
