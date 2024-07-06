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
      "devtoys"
      "discord"
      "docker"
      "figma"
      "firefox"
      "firefox@developer-edition"
      "fontforge"
      "gimp"
      "google-chrome"
      "gramps"
      "inkscape"
      "jordanbaird-ice"
      "loungy"
      "markedit"
      "obsidian"
      "raycast"
      "sf-symbols"
      "spotify"
      "visual-studio-code"
      "zed"
      "zoom"
      "zulip"
    ];
  };
}
