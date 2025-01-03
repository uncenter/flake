{ lib, osConfig, ... }:
{
  programs.direnv = lib.mkIf osConfig.glade.cli.enable {
    enable = true;
    nix-direnv.enable = true;

    config = {
      whitelist.prefix = [ "~/Dev/Projects" ];
    };
  };
}
