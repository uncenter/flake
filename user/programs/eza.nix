{ lib, osConfig, ... }:
{
  programs.eza = lib.mkIf osConfig.glade.programs.enable {
    enable = true;

    # Interferes with default ls command.
    enableNushellIntegration = false;

    icons = "auto";

    extraOptions = [
      "--no-permissions"
      "--no-user"
      "--ignore-glob"
      ".git"
    ];
  };
}
