{ pkgs, ... }:
{
  imports = [ ../../user ];

  glade = {
    apps.enable = false;
    programs.enable = true;
    tooling.enable = false;
  };
}
