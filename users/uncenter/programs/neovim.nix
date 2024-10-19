{ pkgs, ... }:
let
  tree-sitter-tera = pkgs.tree-sitter.buildGrammar {
    language = "tera";
    version = "0.1.0+rev=758641b";
    src = pkgs.fetchFromGitHub {
      owner = "uncenter";
      repo = "tree-sitter-tera";
      rev = "758641bcb9e8784b3b436aea2f5b976ea889a50e";
      hash = "sha256-agEIZgR/gvSZnaK2uuNZaOtHX0L9yoASHUmgrImE1oc=";
    };
  };
in
{
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin = {
      enable = true;

      settings = {
        flavour = "macchiato";
      };
    };

    plugins = {
      lualine.enable = true;

      treesitter = {
        enable = true;

        settings = {
          highlight.enable = true;
        };

        grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars ++ [
          tree-sitter-tera
        ];
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
