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
            run = "plugin toggle-pane min-preview";
            desc = "Show or hide preview pane";
          }
          {
            on = [ "M" ];
            run = "plugin toggle-pane max-preview";
            desc = "Maximize preview pane";
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

    plugins = lib.genAttrs [
      "toggle-pane"
      "chmod"
      "full-border"
      "no-status"
      "starship"
      "ouch"
      "relative-motions"
    ] (name: pkgs.yaziPlugins.${name});

    initLua = ''
      require("starship"):setup()
      require("relative-motions"):setup({ show_numbers = "relative_absolute" })
      require("full-border"):setup()
      require("no-status"):setup()
    '';
  };
}
