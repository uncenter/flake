{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.nvf.homeManagerModules.default];

  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      enableEditorconfig = true;
      preventJunkFiles = true;
      enableLuaLoader = true;
      useSystemClipboard = true;

      languages = {
        enableTreesitter = true;
        enableFormat = true;
        enableLSP = true;

        bash.enable = true;
        css.enable = true;
        rust.enable = true;
        nix.enable = true;
        tailwind.enable = true;
        ts.enable = true;
        python.enable = true;
        markdown.enable = true;
        html.enable = true;
      };

      lsp = {
        formatOnSave = true;
        lspkind.enable = true;
        null-ls.enable = true;
      };

      autocomplete.enable = true;
      autopairs.enable = true;
      git.enable = true;
      telescope.enable = true;

      comments = {
        comment-nvim.enable = true;
      };

      filetree = {
        nvimTree.enable = true;
      };

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      presence = {
        neocord.enable = true;
      };

      visuals = {
        enable = true;
        fidget-nvim.enable = true;
        nvimWebDevicons.enable = true;

        indentBlankline = {
          enable = true;
          fillChar = null;
          eolChar = null;
          scope.enabled = true;
        };
      };

      statusline = {
        lualine = {
          enable = true;
          theme = "catppuccin";
        };
      };

      theme = {
        enable = true;
        name = "catppuccin";
        style = "frappe";
        transparent = true;
      };

      notify = {
        nvim-notify.enable = true;
      };

      utility = {
        ccc.enable = true;
        vim-wakatime = {
          enable = true;
          cli-package = pkgs.wakatime;
        };
      };

      ui = {
        noice.enable = true;
        colorizer.enable = true;
        breadcrumbs.enable = true;
        illuminate.enable = true;
      };

      extraPlugins = {
        template-string = {
          package = pkgs.vimUtils.buildVimPlugin {
            name = "template-string.nvim";
            src = pkgs.fetchFromGitHub {
              owner = "axelvc";
              repo = "template-string.nvim";
              rev = "419bfb2e4d5f0e6ddd0d4435f85b69da0d88d524";
              sha256 = "sha256-whpIzym2rHE6BGqVqJz/5xfuGTOJb8W5AWhuYQbmYoQ=";
            };
          };
          setup = ''
            require('template-string').setup {}
          '';
        };

        screenkey = {
          package = pkgs.vimUtils.buildVimPlugin {
            name = "screenkey.nvim";
            src = pkgs.fetchFromGitHub {
              owner = "NStefan002";
              repo = "screenkey.nvim";
              rev = "c45619aa02489cc89da459c84625fab64aca4099";
              sha256 = "sha256-n1CB9TyYWvk6xu/iMewK0/vuTk7YknQLXc3UOQKJr7M=";
            };
          };
        };
      };
    };
  };
}
