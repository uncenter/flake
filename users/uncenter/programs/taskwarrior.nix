{ pkgs, ... }:
{
  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
  };
}
