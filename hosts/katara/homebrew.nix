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
      # "google-chrome"
      "google-chrome@beta"
      # "firefox"
      "firefox@developer-edition"
      "zen"

      # Developer Tooling
      "devtoys"
      "ghostty"
      "intellij-idea"
      "sublime-text"
      "visual-studio-code"
      "yaak"
      "zed"
      "zed@preview"

      # Communication
      "halloy"
      "signal"
      "slack"
      "vesktop"
      "zoom"

      # Media Editing
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

      # Productivity
      "1password"
      "notion"
      "obsidian"
      "raycast"

      # Other
      "calibre"
      "gramps"
      "netnewswire"
      "obs"
      "sf-symbols"
    ];
  };
}
