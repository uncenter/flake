{
  lib,
  config,
  osConfig,
  ...
}:
{
  programs.bash = lib.mkIf osConfig.glade.shells.bash.enable {
    enable = true;

    historyFile = "${config.xdg.dataHome}/bash/bash_history";
  };
}
