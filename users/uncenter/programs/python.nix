{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python312
    poetry
    ruff
    uv
  ];
}
