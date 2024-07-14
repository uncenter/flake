{ ... }:
{
  imports = [ ./icons.nix ];

  networking = {
    computerName = "Katara";
    hostName = "katara";
    localHostName = "katara";
  };

  security.pam.enableSudoTouchIdAuth = true;
}
