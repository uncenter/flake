{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.glade.tooling.typst.enable {
    home.packages = with pkgs; [
      typst
      tinymist
    ];
  };
}
