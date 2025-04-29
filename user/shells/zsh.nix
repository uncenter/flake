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
    dotDir =
      (lib.strings.removePrefix (config.home.homeDirectory + "/") config.xdg.configHome) + "/zsh";
  };
}
