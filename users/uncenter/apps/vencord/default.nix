{
  lib,
  pkgs,
  config,
  ...
}:
let
  mkLink = config.lib.file.mkOutOfStoreSymlink;

  flakeDir = "${config.home.homeDirectory}/.config/flake/users/uncenter/apps/vencord";
  settingsFile = mkLink "${flakeDir}/settings.json";
in
{
  home.file =
    let
      common = "Library/Application Support/Vencord/settings";
    in
    lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
      "${common}/settings.json".source = settingsFile;
      "${common}/quickCss.css".text = ''
        @import url("https://raw.githubusercontent.com/uncenter/ctp-midnight/main/themes/${config.catppuccin.flavor}-${config.catppuccin.accent}.css") (prefers-color-scheme: dark);
        @import url("https://raw.githubusercontent.com/uncenter/ctp-midnight/main/themes/latte-${config.catppuccin.accent}.css") (prefers-color-scheme: light);
      '';
    };
}
