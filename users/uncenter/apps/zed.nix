{
  lib,
  pkgs,
  ...
}:
{
  programs.zed-editor = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    enable = true;

    extensions = [
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
        light = lib.mkForce "Catppuccin Latte";
      };

      format_on_save = "on";
      languages = {
        Nix = {
          language_servers = [
            "!nil"
            "nixd"
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
