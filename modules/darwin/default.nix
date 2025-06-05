{
  imports = [ ./homebrew.nix ];

  nix = {
    # Adjusts interval to match "03:15" interval used on NixOS (daily, as opposed to the default weekly on darwin).
    gc.interval = {
      Hour = 3;
      Minute = 15;
    };
  };

  # https://daiderd.com/nix-darwin/manual/index.html#sec-options
  system = {
    defaults = {
      dock = {
        autohide = true;
        show-recents = false;
        tilesize = 80;

        # Hot Corners
        wvous-bl-corner = 3; # Application Windows
        wvous-tl-corner = 2; # Mission Control
      };
      finder = {
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        AppleShowAllFiles = true;
        QuitMenuItem = true;
        ShowPathbar = true;
      };
      menuExtraClock = {
        Show24Hour = true;
        ShowDate = 0;
      };
    };
  };

  # https://github.com/ryan4yin/nix-darwin-kickstarter/blob/f79b4d4cbd9c8c2ea56b6e5016131ff2179d3775/minimal/modules/system.nix#L14-L19
  system.activationScripts.postActivation.text = ''
    killall Dock
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  security.sudo.extraConfig = ''
    Defaults    env_keep += "TERMINFO"
  '';

  system.primaryUser = "uncenter";
  system.stateVersion = 5;
}
