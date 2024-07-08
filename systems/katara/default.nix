{...}: {
  imports = [./packages.nix ./icons.nix];

  security.pam.enableSudoTouchIdAuth = true;
}
