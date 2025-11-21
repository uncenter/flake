{ pkgs, ... }:
{
  imports = [
    ./apps.nix
  ];

  glade = {
    apps.enable = true;
    programs.enable = true;
    tooling.enable = true;
  };

  environment.systemPackages = with pkgs; [ _1password-cli ];

  networking = {
    computerName = "Katara";
    hostName = "katara";
    localHostName = "katara";
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
