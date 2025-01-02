{ pkgs, ... }:
{
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
}
