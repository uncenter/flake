{ pkgs, ... }:
{
  home.packages = with pkgs; [
    departure-mono
    nerd-fonts.commit-mono
    nerd-fonts._0xproto
    nerd-fonts.lilex
  ];
}
