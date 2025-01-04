{ lib, osConfig, ... }:
{
  programs.bat = lib.mkIf osConfig.glade.programs.enable {
    enable = true;
  };
}
