{
  imports = [
    ./nix.nix
    ./substituters.nix
    ./options.nix
    ./services
  ];
  programs.fish.enable = true;
}
