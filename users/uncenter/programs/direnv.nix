{ lib, osConfig, ... }:
{
  programs.direnv = lib.mkIf osConfig.glade.programs.enable {
    enable = true;
    nix-direnv.enable = true;

    config = {
      whitelist.prefix = [ "~/Dev/Projects" ];
    };
  };
}
