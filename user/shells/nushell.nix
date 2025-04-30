{
  lib,
  osConfig,
  ...
}:
{
  programs.nushell = lib.mkIf osConfig.glade.shells.nushell.enable {
    enable = true;

    settings = {
      show_banner = false;

      rm.always_trash = true;
    };
  };
}
