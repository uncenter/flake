{
  imports = [
    ./nix.nix
    ./options.nix
    ./tailscale.nix
  ];
  programs.fish.enable = true;
}
