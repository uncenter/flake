{
  homebrew = {
    taps = [ ];

    brews = [
      "coreutils"
      "swift-format"
      "terminal-notifier"
    ];

    casks = [
      # Browsers
      "google-chrome"
      "google-chrome@beta"
      # "firefox"
      "firefox@developer-edition"

      # Developer Tooling
      "devtoys"
      "ghostty"
      "github" # GitHub Desktop
      "intellij-idea"
      "sublime-text"
      "visual-studio-code"
      "yaak"
      "zed"
      "zed@preview"

      # Communication
      "signal"
      "slack"
      "vesktop"
      "zoom"
      "whatsapp"

      # Media Editing
      "affinity"
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "cleanshot"
      "figma"
      "gimp"
      "inkscape"

      # Utilities
      "keka"
      "localsend"
      "mediamate"
      "balenaetcher"

      # Productivity
      "1password"
      "notion"
      "obsidian"
      "raycast"
      "ticktick"

      # Other
      "gramps"
      "netnewswire"
      "obs"
      "sf-symbols"
    ];
  };

  # https://github.com/uncenter/nix-darwin-login-items
  environment.loginItems = {
    enable = true;
    items = [
      "/Applications/Raycast.app"
      "/Applications/Ghostty.app"
      "/Applications/Dato.app"
      "/Applications/Hyperduck.app"
      "/Applications/Color Picker.app"
      "/Applications/1Password.app"
      "/Applications/Klack.app"
      "/Applications/CleanShot X.app"
      "/Applications/MediaMate.app"
    ];
  };

  # https://github.com/ryanccn/nix-darwin-custom-icons
  environment.customIcons = {
    enable = true;
    icons = [
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
    ];
  };

}
