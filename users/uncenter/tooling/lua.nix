{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.glade.tooling.lua.enable {
    home.packages = with pkgs; [
      lua
      luajitPackages.luarocks

      # Luau
      luau
      lune
      selene
    ];
  };
}
