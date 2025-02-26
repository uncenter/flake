{
  imports = [
    ./nix.nix
    ./substituters.nix
    ./options.nix
    ./tailscale.nix
  ];
  programs.fish.enable = true;
}
