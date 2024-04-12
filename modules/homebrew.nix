_: {
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
      "homebrew/cask-versions"
      "homebrew/bundle"

      "1password/tap"
    ];

    brews = [];

    casks = [
      "1password"
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "alt-tab"
      "arc"
      "calibre"
      "cleanshot"
      "codeedit"
      "discord"
      "docker"
      "firefox"
      "firefox-developer-edition"
      "gimp"
      "google-chrome"
      "gramps"
      "handbrake"
      "inkscape"
      "jordanbaird-ice"
      "knockknock"
      "loungy"
      "maccy"
      "obsidian"
      "orion"
      "oversight"
      "polypane"
      "raycast"
      "rectangle"
      "sf-symbols"
      "spotify"
      "thunderbird"
      "visual-studio-code"
      "zed"
      "zoom"
    ];
  };
}
