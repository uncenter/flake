{
  self,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/nix.nix
    ./modules/packages.nix
    ./modules/homebrew.nix
  ];

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

  security.pam.enableSudoTouchIdAuth = true;

  # https://github.com/ryanccn/nix-darwin-custom-icons
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/Applications/1Password.app";
        icon = ./icons/1password.icns;
      }
      {
        path = "/Applications/Arc.app";
        icon = ./icons/arc.icns;
      }
      {
        path = "/Applications/Calibre.app";
        icon = ./icons/calibre.icns;
      }
      {
        path = "/Applications/DevFolderIcon.app";
        icon = ./icons/devfolder.icns;
      }
      {
        path = "/Applications/Discord.app";
        icon = ./icons/discord.icns;
      }
      {
        path = "/Applications/DevFolderIcon.app";
        icon = ./icons/devfolder.icns;
      }
      {
        path = "/Applications/Figma.app/";
        icon = ./icons/figma.icns;
      }
      {
        path = "/Applications/Ghostty.app";
        icon = ./icons/ghostty.icns;
      }
      {
        path = "/Applications/Gramps.app";
        icon = ./icons/gramps.icns;
      }
      {
        path = "/Applications/Inkscape.app";
        icon = ./icons/inkscape.icns;
      }
      {
        path = "/Applications/Obsidian.app";
        icon = ./icons/obsidian.icns;
      }
      {
        path = "/Applications/ScreenshotsFolderIcon.app";
        icon = ./icons/screenshotsfolder.icns;
      }
      {
        path = "/Applications/ScreenshotsFolderIcon.app";
        icon = ./icons/screenshotsfolder.icns;
      }
      {
        path = "/Applications/Spotify.app";
        icon = ./icons/spotify.icns;
      }
      {
        path = "/Applications/Visual Studio Code.app";
        icon = ./icons/vscode.icns;
      }
      {
        path = "/Applications/Zoom.app";
        icon = ./icons/zoom.icns;
      }
      {
        path = "/Applications/Zed.app";
        icon = ./icons/zed.icns;
      }
    ];
  };

  system.activationScripts = {
    # https://github.com/ryan4yin/nix-darwin-kickstarter/blob/f79b4d4cbd9c8c2ea56b6e5016131ff2179d3775/minimal/modules/system.nix#L14-L19
    postUserActivation.text = ''
      killall Dock
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';
  };

  programs.fish.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit self inputs;
    };

    users.uncenter = import ./home;
  };

  users.users.uncenter = {
    home = "/Users/uncenter";
    shell = pkgs.fish;
  };

  system.stateVersion = 4;
}
