{ pkgs, ... }:
{
  home.packages = with pkgs; [
    erlang_26
    gleam
    rebar3

    # Required for Lustre's dev server.
    inotify-tools
  ];
}
