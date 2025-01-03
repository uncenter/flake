{ lib, osConfig, ... }:
{
  programs.lazygit = lib.mkIf osConfig.glade.tui.enable {
    enable = true;
  };
}
