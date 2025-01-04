{ lib, osConfig, ... }:
{
  programs.fzf = lib.mkIf osConfig.glade.programs.enable {
    enable = true;
  };
}
