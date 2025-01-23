{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.glade.tooling.lua.enable {
    home.packages =
      with pkgs;
      [
        lua
        stylua

        # Luau
        luau
        lune
        selene
      ]
      ++ (with pkgs.luajitPackages; [ luarocks ]);
  };
}
