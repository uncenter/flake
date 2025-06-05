{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  programs.zed-editor = lib.mkIf osConfig.glade.apps.enable {
    enable = true;
    package = pkgs.emptyDirectory;

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
      "vento"
      "marksman"
      "svelte"
      "nu"

      "wakatime"
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
