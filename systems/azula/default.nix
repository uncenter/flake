{ pkgs, ... }:
{
  glade = {
    apps.enable = false;

    programs = {
      enable = true;
      media.enable = false;
    };

    tooling.enable = true;
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
