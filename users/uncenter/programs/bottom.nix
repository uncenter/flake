{ lib, osConfig, ... }:
{
  programs.bottom = lib.mkIf osConfig.glade.programs.enable {
    enable = true;
  };
}
