{
  pkgs,
  inputs,
  config,
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

      theme = {
        enable = true;
        name = "catppuccin";
        style = config.catppuccin.flavor;
        transparent = true;
      };

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
        ts.extensions.ts-error-translator.enable = true;
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

      terminal = {
        toggleterm = {
          enable = true;
          lazygit.enable = true;

          setupOpts.direction = "float";
        };
      };

      tabline.nvimBufferline.enable = true;

      ui = {
        noice.enable = true;
        colorizer.enable = true;
        breadcrumbs.enable = true;
        illuminate.enable = true;
      };

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      maps = {
        normal = {
          "<leader>y" = {
            action = "\"+y";
            desc = "Copy/yank to clipboard";
          };
          "<leader>p" = {
            action = "\"+p";
            desc = "Paste from clipboard";
          };
          "<leader>x" = {
            action = "\"+d";
            desc = "Cut to clipboard";
          };

          "<leader>q" = {
            action = "<cmd>qall<cr>";
            desc = "Quit all";
          };
          "<C-s>" = {
            action = "<cmd>w<cr>";
            desc = "Save file";
          };
          "<C-a>" = {
            action = "<cmd>%y+<cr>";
            desc = "Copy all buffer contents";
          };
        };
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
