{
  pkgs,
  inputs,
  config,
  ...
}:
let
  tree-sitter-tera = pkgs.tree-sitter.buildGrammar {
    language = "tera";
    version = "0.1.0";
    src = inputs.tree-sitter-tera;
  };
  catppuccin-nvim-fork = pkgs.fetchFromGitHub {
    owner = "uncenter";
    repo = "ctp-nvim";
    rev = "ee1620453f62d6a0a262bfd63963934ecf862f2b"; # patch-1 branch
    hash = "sha256-lgeYab1S2uzF84DY2cENubiP53/TeKN4Fp+RI28iL2U=";
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
      signcolumn = "yes";
    };

    colorschemes.catppuccin = {
      enable = true;
      package = catppuccin-nvim-fork;

      settings = {
        flavour = config.catppuccin.flavor;
      };
    };

    plugins = {
      lualine.enable = true;
      nvim-autopairs.enable = true;
      ts-autotag.enable = true;

      cmp.enable = true;
      cmp-path.enable = true;

      wakatime.enable = true;

      direnv.enable = true;

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

      lsp = {
        enable = true;
        servers = {
          ts_ls.enable = true; # TS/JS
          cssls.enable = true; # CSS
          superhtml = {
            enable = true;
            package = pkgs.superhtml;
          };
          eslint.enable = true; # Web
          tailwindcss.enable = true; # TailwindCSS
          html.enable = true; # HTML
          astro.enable = true; # AstroJS
          svelte.enable = false; # Svelte
          vuels.enable = false; # Vue
          marksman.enable = true; # Markdown
          nil_ls.enable = true; # Nix
          bashls.enable = true; # Bash
          clangd.enable = true; # C/C++
          yamlls.enable = true; # YAML
          gleam.enable = true;
          ruff.enable = true;
          statix.enable = true;
          gopls = {
            # Golang
            enable = true;
            autostart = true;
          };
        };
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
      (pkgs.vimUtils.buildVimPlugin {
        name = "bullets";
        src = pkgs.fetchFromGitHub {
          owner = "bullets-vim";
          repo = "bullets.vim";
          rev = "2253f970e54320dbd76fd6bb4f5a0bf2436ce232";
          hash = "sha256-bPnLlaKphp9d25SoKdt1wFa+t51HYeZ3o5uc40keiHs=";
        };
      })
    ];
  };
}
