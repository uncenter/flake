{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.glade.tooling.javascript.enable {
    home.packages = with pkgs; [
      nodejs_latest
      bun
      deno
      pnpm
    ];
  };
}
