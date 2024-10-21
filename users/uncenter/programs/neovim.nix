{ pkgs, inputs, ... }:
let
  tree-sitter-tera = pkgs.tree-sitter.buildGrammar {
    language = "tera";
    version = "0.1.0";
    src = inputs.tree-sitter-tera;
  };
in
{
  programs.nixvim = {
    enable = true;

    luaLoader.enable = true;

    clipboard.register = "unnamedplus";

    opts = {
      tabstop = 4;
      nu = true;
      relativenumber = false;
    };

    colorschemes.catppuccin = {
      enable = true;

      settings = {
        flavour = "macchiato";
      };
    };

    plugins = {
      lualine.enable = true;
      nvim-autopairs.enable = true;

      cmp.enable = true;
      cmp-path.enable = true;

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      treesitter = {
        enable = true;

        settings = {
          highlight.enable = true;
        };

        grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars ++ [
          tree-sitter-tera
        ];
      };

      rustaceanvim = {
        enable = true;
        settings.server.default_settings.rust-analyzer = {
          checkOnSave = true;
          check = {
            command = "clippy";
            features = "all";
          };
          rustc.source = "discover";
        };
      };
    };

    extraConfigLua = ''
      do
        vim.filetype.add({ extension = { tera = "tera" } })

        vim.api.nvim_create_autocmd("FileType", {
          pattern = "tera",
          callback = function(event)
            vim.bo[event.buf].commentstring = "{# %s #}"
          end,
        })

        require("nvim-treesitter.parsers").get_parser_configs().tera = {
          install_info = {
            url = "${tree-sitter-tera}",
            files = { "src/parser.c" },
          },
          filetype = "tera",
        }
      end
    '';

    extraPlugins = [
      tree-sitter-tera
    ];
  };
}
