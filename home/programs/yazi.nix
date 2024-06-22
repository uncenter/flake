{pkgs, ...}: let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "a882e3828cdeee243ede2bff0524cbe7e27104cf";
    hash = "sha256-+amnL025nNHcP/gXY57FYUhUXNlPRqbQHS4EkOL/INs=";
  };
in {
  programs.yazi = {
    enable = true;
    catppuccin.enable = true;

    enableFishIntegration = true;

    settings = {
      manager = {
        ratio = [2 3 3];
        sort_by = "alphabetical";
        sort_sensitive = true;
        sort_reverse = true;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
      };
      preview = {
        tab_size = 4;
      };
    };

    keymap = {
      manager.prepend_keymap = [
        {
          on = ["<Space>"];
          run = ["select --state=none"];
          desc = "Toggle the current selection state";
        }

        {
          on = ["<C-w>"];
          run = ["close"];
          desc = "Close the current tab, or quit if it is last tab";
        }
        {
          on = ["<C-t>"];
          run = "tab_create --current";
          desc = "Create a new tab using the current path";
        }

        {
          on = ["t"];
          run = "plugin --sync hide-preview";
          desc = "Hide or show preview";
        }
        {
          on = ["T"];
          run = "plugin --sync max-preview";
          desc = "Maximize or shrink preview";
        }
      ];
    };
  };

  xdg.configFile = {
    "yazi/init.lua".text = ''
      require("starship"):setup()
    '';
    "yazi/plugins/starship.yazi".source = pkgs.fetchFromGitHub {
      owner = "Rolv-Apneseth";
      repo = "starship.yazi";
      rev = "6197e4cca4caed0121654079151632f6abcdcae9";
      sha256 = "sha256-oHoBq7BESjGeKsaBnDt0TXV78ggGCdYndLpcwwQ8Zts=";
    };
    "yazi/plugins/hide-preview.yazi".source = "${yazi-plugins}/hide-preview.yazi";
    "yazi/plugins/max-preview.yazi".source = "${yazi-plugins}/max-preview.yazi";
  };
}
