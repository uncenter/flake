{ lib, osConfig, ... }:
{
  programs.atuin = lib.mkIf osConfig.glade.cli.enable {
    enable = true;

    enableFishIntegration = true;
    enableBashIntegration = true;

    settings = {
      inline_height = 0;
    };
  };
}
