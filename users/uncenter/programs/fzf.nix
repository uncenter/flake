{ lib, osConfig, ... }:
{
  programs.fzf = lib.mkIf osConfig.glade.cli.enable {
    enable = true;
  };
}
