{ lib, osConfig, ... }:
{
  programs.bottom = lib.mkIf osConfig.glade.cli.enable {
    enable = true;
  };
}
