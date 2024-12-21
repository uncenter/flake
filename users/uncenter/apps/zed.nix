{
  lib,
  pkgs,
  config,
  ...
}:
let
  mkUpper =
    str:
    (lib.toUpper (builtins.substring 0 1 str)) + (builtins.substring 1 (builtins.stringLength str) str);
in
{
  programs.zed-editor = lib.mkIf pkgs.stdenv.isDarwin {
    enable = true;

    extensions = [
      # Appearance
      "catppuccin"

      # Language/Tool Support
      "html"
      "superhtml"
      "tera"
      "toml"
      "vue"
      "scss"
      "nix"
      "just"
      "scheme"
    ];

    userSettings = {
      buffer_font_family = "Lilex Nerd Font";
      theme = {
        mode = "system";
        light = "Catppuccin Latte";
        dark = "Catppuccin ${mkUpper config.catppuccin.flavor}";
      };
      format_on_save = "on";
      languages = {
        Nix = {
          language_servers = [
            "nil"
            "!nixd"
          ];
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };
      };
    };
  };
}
