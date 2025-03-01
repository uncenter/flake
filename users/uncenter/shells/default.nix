{
  imports = [
    ./bash.nix
    ./fish.nix
    ./nushell.nix
    ./zsh.nix
  ];

  home.shellAliases = {
    "cat" = "bat";
    "lg" = "lazygit";
  };
}
