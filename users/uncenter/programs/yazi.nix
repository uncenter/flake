{ pkgs, lib, ... }:
{
  programs.yazi = {
    enable = true;
    catppuccin.enable = true;

    enableFishIntegration = true;
    enableBashIntegration = true;

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
            run = [ "select --state=none" ];
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
          rev = "ec97f8847feeb0307d240e7dc0f11d2d41ebd99d";
          hash = "sha256-By8XuqVJvS841u+8Dfm6R8GqRAs0mO2WapK6r2g7WI8=";
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
          rev = "247f49da1c408235202848c0897289ed51b69343";
          hash = "sha256-0J6hxcdDX9b63adVlNVWysRR5htwAtP5WhIJ2AK2+Gs=";
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
          rev = "df97039a04595a40a11024f321a865b3e9af5092";
          hash = "sha256-csX8T2a5f7k6g2mlR+08rm0qBeWdI4ABuja+klIvwqw=";
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
