{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = with pkgs; [
    python312
    poetry
    ruff
  ];
}
