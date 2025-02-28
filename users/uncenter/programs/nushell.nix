{
  lib,
  osConfig,
  ...
}:
{
  programs.nushell = lib.mkIf osConfig.glade.shells.nushell.enable {
    enable = true;

    configFile.text = ''
      $env.config.show_banner = false
    '';
  };
}
