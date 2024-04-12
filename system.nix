{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/nix.nix
    ./modules/packages.nix
    ./modules/homebrew.nix
  ];

  system = {
    activationScripts.extraActivation = {
      text = ''
        set -eo pipefail
        HOME="/var/root" ${pkgs.lib.getExe pkgs.nvd} --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
      '';
    };

    defaults = {
      dock = {
        autohide = true;
        show-recents = false;
      };
      finder = {
        AppleShowAllExtensions = true;
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

  environment.customIcons = {
    enable = true;
    icons = [
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
        path = "/Applications/Gramps.app";
        icon = ./icons/gramps.icns;
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
        path = "/Applications/Ghostty.app";
        icon = ./icons/term.icns;
      }
      {
        path = "/Applications/Zoom.app";
        icon = ./icons/zoom.icns;
      }
    ];
  };

  programs.bash.enable = true;
  programs.fish.enable = true;
  programs.zsh.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs;
    };

    users.uncenter = import ./home;
  };

  users.users.uncenter = {
    home = "/Users/uncenter";
  };

  system.stateVersion = 4;
}
