{
  lib,
  osConfig,
  ...
}:
{
  programs.bash = lib.mkIf osConfig.glade.shells.bash.enable {
    enable = true;
  };
}
