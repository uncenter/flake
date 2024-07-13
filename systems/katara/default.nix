{ ... }:
{
  imports = [ ./icons.nix ];

  security.pam.enableSudoTouchIdAuth = true;
}
