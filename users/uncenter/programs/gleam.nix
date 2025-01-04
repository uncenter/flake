{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.glade.tooling.gleam.enable {
    home.packages =
      with pkgs;
      [
        erlang_26
        gleam
        rebar3
      ]
      ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [
        # Required for Lustre's dev server.
        inotify-tools
      ];
  };
}
