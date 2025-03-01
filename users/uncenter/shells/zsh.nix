{
  lib,
  osConfig,
  ...
}:
{
  programs.zsh = lib.mkIf osConfig.glade.shells.zsh.enable {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
}
