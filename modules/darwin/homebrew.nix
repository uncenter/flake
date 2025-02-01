{ pkgs, ... }:
{
  # https://docs.brew.sh/Manpage#environment
  environment.variables = {
    HOMEBREW_NO_ANALYTICS = "1";
    HOMEBREW_NO_INSECURE_REDIRECT = "1";
    HOMEBREW_NO_EMOJI = "1";
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    taps = [
      "homebrew/services"
      "homebrew/bundle"

      "1password/tap"
    ];

    brews = [
      "coreutils"
      "swift-format"
    ];

    casks = [
      "1password"
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "arc"
      "calibre"
      "chatgpt"
      "cleanshot"
      # "confectionery"
      "devtoys"
      "discord"
      "docker"
      "figma"
      # "firefox"
      "firefox@developer-edition"
      "ghostty"
      "gimp"
      # "google-chrome"
      "google-chrome@beta"
      "gramps"
      "inkscape"
      "intellij-idea"
      "jordanbaird-ice"
      "keka"
      "localsend"
      "mediamate"
      "netnewswire"
      "obs"
      "obsidian"
      "raycast"
      "sf-symbols"
      "slack"
      "sublime-text"
      "yaak"
      "zen-browser"
      "zoom"
    ];
  };

  environment.systemPackages = with pkgs; [ terminal-notifier ];
}
