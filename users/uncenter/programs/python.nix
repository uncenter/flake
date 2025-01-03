{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.glade.python.enable {
    home.packages = with pkgs; [
      python312
      poetry
      ruff
      uv
    ];
  };
}
