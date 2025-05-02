{
  # https://github.com/ryanccn/nix-darwin-custom-icons
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/Applications/Ghostty.app";
        icon = ./icons/ghostty.icns;
      }
    ];
  };
}
