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
    lib.mkIf pkgs.stdenv.isDarwin {
      "${common}/settings.json".source = settingsFile;
      "${common}/quickCss.css".text = ''
        @import url("https://catppuccin.github.io/discord/dist/catppuccin-${config.catppuccin.flavor}.theme.css") (prefers-color-scheme: dark);
        @import url("https://catppuccin.github.io/discord/dist/catppuccin-latte.theme.css") (prefers-color-scheme: light);
      '';
    };
}
