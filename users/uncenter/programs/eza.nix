{ lib, osConfig, ... }:
{
  programs.eza = lib.mkIf osConfig.glade.cli.enable {
    enable = true;
    icons = "auto";

    extraOptions = [
      "--no-permissions"
      "--no-user"
      "--ignore-glob"
      ".git"
    ];
  };
}
