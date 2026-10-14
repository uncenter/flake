{
  homebrew = {
    onActivation.extraFlags = [
      "--force-cleanup"
    ]; # TODO: Temporary fix for https://github.com/nix-darwin/nix-darwin/issues/1787.

    taps = [
      "abue-ammar/tinycast"
    ];

    brews = [
      "coreutils"
      "swift-format"
    ];

    casks = [
      # Browsers
      "google-chrome"
      "google-chrome@beta"
      "firefox"
      "firefox@developer-edition"
      "confectionery" # (minimal, for screenshots)

      # Developer Tooling
      ## Editors
      "intellij-idea"
      "sublime-text"
      "visual-studio-code"
      "zed"
      "zed@preview"
      ## Other
      "devtoys" # Powertoys-like
      "ghostty"
      "github" # GitHub Desktop
      "godot"
      "yaak"

      # Communication
      "signal"
      "slack"
      "vesktop"
      "zoom"
      "whatsapp"

      # Media Viewing & Editing
      "affinity"
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "cleanshot"
      "figma"
      "gimp"
      "inkscape"
      "krita"
      "iina"
      "subtitle-edit"

      # Productivity & Note Taking
      "anki"
      "notion"
      "notion-calendar"
      "obsidian"
      # "raycast"
      "tinycast"
      "microsoft-word"

      # Auth/Passwords
      "1password"
      "yubico-authenticator"
      "protonvpn"

      # Utilities
      "keka"
      "localsend"
      "mediamate"
      "handy" # speech to text
      "balenaetcher"
      "calibre"

      # Other
      "gramps"
      "cardhop"
      "netnewswire"
      "obs"
      "sf-symbols"
    ];
  };

  # https://github.com/uncenter/nix-darwin-login-items
  environment.loginItems = {
    enable = true;
    items = [
      # "/Applications/Raycast.app"
      "/Applications/Tinycast.app"
      "/Applications/Ghostty.app"
      "/Applications/Dato.app"
      "/Applications/Velja.app"
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
      # {
      #   path = "/Applications/Notion.app";
      #   icon = ./icons/notion.icns;
      # }
      # {
      #   path = "/Applications/Obsidian.app";
      #   icon = ./icons/obsidian.icns;
      # }
      # {
      #   path = "/Applications/Visual Studio Code.app";
      #   icon = ./icons/vscode.icns;
      # }
      # {
      #   path = "/Applications/Zed.app";
      #   icon = ./icons/zed.icns;
      # }
    ];
  };

}
