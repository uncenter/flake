{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  cfg = osConfig.glade;
in

{
  programs.yazi = lib.mkIf cfg.programs.enable {
    enable = true;

    enableFishIntegration = true;
    enableBashIntegration = cfg.shells.bash.enable;
    enableNushellIntegration = cfg.shells.nushell.enable;

    settings = {
      manager = {
        ratio = [
          2
          3
          3
        ];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
      };
      preview = {
        tab_size = 4;
        wrap = "yes";
        max_width = 1200;
        max_height = 1800;
      };
      opener = {
        edit = [
          {
            run = "\${EDITOR:-vi} \"$@\"";
            desc = "$EDITOR";
            block = true;
          }
          {
            run = "\${VISUAL:-code} \"$@\"";
            desc = "$VISUAL";
            orphan = true;
          }
        ];
        extract = [
          {
            run = "ouch d -y \"$@\"";
            desc = "Extract here with ouch";
          }
        ];
      };
    };

    keymap = {
      manager.prepend_keymap =
        [
          {
            on = [ "<Space>" ];
            run = [ "toggle --state=none" ];
            desc = "Toggle the current selection state";
          }
          {
            desc = "Open shell here";
            on = "!";
            run = "shell \"$SHELL\" --block --confirm";
          }
          {
            on = "<C-p>";
            run = ''shell 'qlmanage -p "$@"' --confirm'';
          }

          {
            on = [
              "g"
              "f"
            ];
            run = "cd ~/.config/flake";
            desc = "[ G ]o to the system [ f ]lake directory";
          }
          {
            on = [
              "g"
              "d"
            ];
            run = "cd ~/Dev";
            desc = "[ G ]o to the [ d ]evelopment directory";
          }
          {
            on = [
              "g"
              "D"
            ];
            run = "cd ~/Downloads";
            desc = "[ G ]o to the [ d ]ownloads directory";
          }

          {
            on = [ "m" ];
            run = "plugin --sync hide-preview";
            desc = "Minimize preview";
          }
          {
            on = [ "M" ];
            run = "plugin --sync max-preview";
            desc = "Maximize preview";
          }

          {
            on = [
              "c"
              "m"
            ];
            run = "plugin chmod";
            desc = "Chmod on selected files";
          }

          {
            on = [ "C" ];
            run = "plugin ouch --args=zip";
            desc = "Compress with ouch";
          }
        ]
        ++ (map (
          stepInt:
          let
            step = toString stepInt;
          in
          {
            on = [ step ];
            run = "plugin relative-motions" + (if step != "0" then " --args=" + step else "");
            desc = "Move in relative steps";
          }
        ) (lib.lists.range 0 9));
    };

    plugins =
      let
        yazi-plugins = pkgs.fetchFromGitHub {
          owner = "yazi-rs";
          repo = "plugins";
          rev = "5186af7984aa8cb0550358aefe751201d7a6b5a8";
          hash = "sha256-Cw5iMljJJkxOzAGjWGIlCa7gnItvBln60laFMf6PSPM=";
        };
      in
      {
        "hide-preview" = "${yazi-plugins}/hide-preview.yazi";
        "max-preview" = "${yazi-plugins}/max-preview.yazi";
        "chmod" = "${yazi-plugins}/chmod.yazi";
        "full-border" = "${yazi-plugins}/full-border.yazi";
        "no-status" = "${yazi-plugins}/no-status.yazi";

        "starship" = pkgs.fetchFromGitHub {
          owner = "Rolv-Apneseth";
          repo = "starship.yazi";
          rev = "f6939fbdbc3fdfcdc2a80251841e429e0cd5cf3c";
          hash = "sha256-5QQsFozbulgLY/Gl6QuKSOTtygULveoRD49V00e0WOw=";
        };

        "ouch" = pkgs.fetchFromGitHub {
          owner = "ndtoan96";
          repo = "ouch.yazi";
          rev = "b8698865a0b1c7c1b65b91bcadf18441498768e6";
          hash = "sha256-eRjdcBJY5RHbbggnMHkcIXUF8Sj2nhD/o7+K3vD3hHY=";
        };

        "relative-motions" = pkgs.fetchFromGitHub {
          owner = "dedukun";
          repo = "relative-motions.yazi";
          rev = "a1466a90a256a8c1e0754a9a1a02c192a8b82c19";
          hash = "sha256-RJSDwH9J9y74pfKmXqUNCEsN19JJNS1aQaxbt8T6TcY=";
        };
      };

    initLua = ''
      require("starship"):setup()
      require("relative-motions"):setup({ show_numbers = "relative_absolute" })
      require("full-border"):setup()
      require("no-status"):setup()
    '';
  };
}
