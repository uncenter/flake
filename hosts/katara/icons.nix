{
  # https://github.com/ryanccn/nix-darwin-custom-icons
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/Applications/Vesktop.app";
        icon = ./icons/discord.icns;
      }
      {
        path = "/Applications/Ghostty.app";
        icon = ./icons/ghostty.icns;
      }
      {
        path = "/Applications/Notion.app";
        icon = ./icons/notion.icns;
      }
      {
        path = "/Applications/Obsidian.app";
        icon = ./icons/obsidian.icns;
      }
      {
        path = "/Applications/Visual Studio Code.app";
        icon = ./icons/vscode.icns;
      }
      {
        path = "/Applications/Zed.app";
        icon = ./icons/zed.icns;
      }
      {
        path = "/Applications/Zen.app";
        icon = ./icons/zen.icns;
      }
    ];
  };
}
