{ lib, osConfig, ... }:
{
  programs.bat = lib.mkIf osConfig.glade.cli.enable {
    enable = true;
  };
}
