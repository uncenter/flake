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

    settings = {
      inline_height = 0;
    };
  };
}
