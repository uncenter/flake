{ ... }:
{
  imports = [
    ./icons.nix
    ./homebrew.nix
  ];

  glade = {
    apps.enable = true;
    programs.enable = true;
    tooling.enable = true;
  };

  networking = {
    computerName = "Katara";
    hostName = "katara";
    localHostName = "katara";
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
