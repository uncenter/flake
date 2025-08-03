{
  lib,
  config,
  osConfig,
  ...
}:
{
  programs.zsh = lib.mkIf osConfig.glade.shells.zsh.enable {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history.path = "${config.xdg.dataHome}/zsh/zsh_history";
    dotDir = "${config.xdg.configHome}/zsh";
  };
}
