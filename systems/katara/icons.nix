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
        path = "/Applications/Calibre.app";
        icon = ./icons/calibre.icns;
      }
      {
        path = "/Applications/DevFolderIcon.app";
        icon = ./icons/devfolder.icns;
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
        path = "/Applications/ScreenshotsFolderIcon.app";
        icon = ./icons/screenshotsfolder.icns;
      }
      {
        path = "/Applications/zoom.us.app";
        icon = ./icons/zoom.icns;
      }
    ];
  };
}
