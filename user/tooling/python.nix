{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.glade.tooling.python.enable {
    home.packages = with pkgs; [
      python312
      poetry
      ruff
      uv
      pyright
      basedpyright
    ];
  };
}
