{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.glade.apps.enable {
    home.packages = with pkgs; [
      departure-mono
      nerd-fonts.commit-mono
      nerd-fonts._0xproto
      nerd-fonts.lilex
    ];
  };
}
