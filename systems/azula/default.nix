{ pkgs, ... }:
{
  glade = {
    cli.enable = true;
    tui.enable = true;
    gui.enable = false;

    media.enable = false;
    data.enable = true;
    networking.enable = true;
    filesystem.enable = true;
    search.enable = true;
    tasks.enable = true;
    misc.enable = true;
    fun.enable = true;

    development.enable = true;
  };

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };

  wsl = {
    enable = true;
    defaultUser = "uncenter";
    startMenuLaunchers = true;

    wslConf.network.hostname = "azula";
  };
}
