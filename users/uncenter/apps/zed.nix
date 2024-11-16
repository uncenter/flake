{
  pkgs,
  lib,
  ...
}:
{
  config = lib.mkIf pkgs.stdenv.isDarwin {
    programs.zed-editor = {
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
        buffer_font_family = "CommitMono Nerd Font";
        theme = {
          mode = "system";
          light = "Catppuccin Latte";
          dark = "Catppuccin Macchiato";
        };
      };
    };
  };
}
