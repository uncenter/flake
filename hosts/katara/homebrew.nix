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
}
