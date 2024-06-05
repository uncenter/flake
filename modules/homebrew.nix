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
      "homebrew/cask-versions"
      "homebrew/bundle"

      "1password/tap"
    ];

    brews = [
      "coreutils"
    ];

    casks = [
      "1password"
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "arc"
      "calibre"
      "cleanshot"
      "codeedit"
      "confectionery"
      "discord"
      "docker"
      "firefox"
      "firefox-developer-edition"
      "fontforge"
      "gimp"
      "google-chrome"
      "gramps"
      "handbrake"
      "inkscape"
      "jordanbaird-ice"
      "knockknock"
      "loungy"
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
      "zulip"
    ];
  };
}
