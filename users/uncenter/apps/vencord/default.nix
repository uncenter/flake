{config, ...}: let
  mkLink = config.lib.file.mkOutOfStoreSymlink;

  flakeDir = "${config.xdg.configHome}/users/uncenter/apps/vencord";
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
