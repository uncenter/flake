{
  lib,
  osConfig,
  ...
}:
let
  cfg = osConfig.glade;
in
{
  programs.atuin = lib.mkIf cfg.programs.enable {
    enable = true;

    enableFishIntegration = true;
    enableBashIntegration = cfg.shells.bash.enable;
    enableNushellIntegration = cfg.shells.nushell.enable;

    settings = {
      inline_height = 0;
    };
  };
}
