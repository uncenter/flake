{ lib, osConfig, ... }:
{
  programs.lazygit = lib.mkIf osConfig.glade.programs.enable {
    enable = true;
  };
}
