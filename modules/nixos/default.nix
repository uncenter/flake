{ lib, ... }:
{
  imports = [
    ./packages.nix
    ./users.nix
  ];
  system.stateVersion = lib.mkDefault "24.05";
}
