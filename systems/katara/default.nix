{...}: {
  imports = [./nix.nix ./packages.nix ./icons.nix];

  security.pam.enableSudoTouchIdAuth = true;
}
