{
  imports = [
    ./bash.nix
    ./fish.nix
    ./nushell.nix
  ];

  home.shellAliases = {
    "cat" = "bat";
    "lg" = "lazygit";
  };
}
