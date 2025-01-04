{ ... }:
{
  imports = [ ./icons.nix ];

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

  security.pam.enableSudoTouchIdAuth = true;
}
