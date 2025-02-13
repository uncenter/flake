{
  imports = [ ./homebrew.nix ];

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

  system.activationScripts = {
    # https://github.com/ryan4yin/nix-darwin-kickstarter/blob/f79b4d4cbd9c8c2ea56b6e5016131ff2179d3775/minimal/modules/system.nix#L14-L19
    postUserActivation.text = ''
      killall Dock
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';
  };

  security.sudo.extraConfig = ''
    Defaults    env_keep += "TERMINFO"
  '';

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 5;
}
