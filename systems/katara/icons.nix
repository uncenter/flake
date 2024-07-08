{
  # https://github.com/ryanccn/nix-darwin-custom-icons
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/Applications/1Password.app";
        icon = ./icons/1password.icns;
      }
      {
        path = "/Applications/Arc.app";
        icon = ./icons/arc.icns;
      }
      {
        path = "/Applications/Calibre.app";
        icon = ./icons/calibre.icns;
      }
      {
        path = "/Applications/DevFolderIcon.app";
        icon = ./icons/devfolder.icns;
      }
      {
        path = "/Applications/Discord.app";
        icon = ./icons/discord.icns;
      }
      {
        path = "/Applications/DevFolderIcon.app";
        icon = ./icons/devfolder.icns;
      }
      {
        path = "/Applications/Figma.app/";
        icon = ./icons/figma.icns;
      }
      {
        path = "/Applications/Ghostty.app";
        icon = ./icons/ghostty.icns;
      }
      {
        path = "/Applications/Gramps.app";
        icon = ./icons/gramps.icns;
      }
      {
        path = "/Applications/Inkscape.app";
        icon = ./icons/inkscape.icns;
      }
      {
        path = "/Applications/Obsidian.app";
        icon = ./icons/obsidian.icns;
      }
      {
        path = "/Applications/ScreenshotsFolderIcon.app";
        icon = ./icons/screenshotsfolder.icns;
      }
      {
        path = "/Applications/ScreenshotsFolderIcon.app";
        icon = ./icons/screenshotsfolder.icns;
      }
      {
        path = "/Applications/Spotify.app";
        icon = ./icons/spotify.icns;
      }
      {
        path = "/Applications/Visual Studio Code.app";
        icon = ./icons/vscode.icns;
      }
      {
        path = "/Applications/zoom.us.app";
        icon = ./icons/zoom.icns;
      }
      {
        path = "/Applications/Zed.app";
        icon = ./icons/zed.icns;
      }
    ];
  };
}
