{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  config.programs.nixvim = {
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
      package = pkgs.vimUtils.buildVimPlugin {
        pname = "catppuccin-nvim";
        version = "0.0.1";
        src = inputs.ctp-nvim;
        nvimSkipModule = [
          "catppuccin.groups.integrations.noice"
          "catppuccin.groups.integrations.feline"
          "catppuccin.lib.vim.init"
        ];
      };

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
      };

      lspconfig.enable = true;

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

    lsp = {
      servers = {
        ts_ls.enable = true; # TS/JS
        cssls.enable = true; # CSS
        superhtml.enable = true;
        html.enable = true; # HTML
        marksman.enable = true; # Markdown
        yamlls.enable = true; # YAML
        nil_ls.enable = true; # Nix
        statix.enable = true;
      };
    };

    extraConfigLua = # lua
      ''
        do
        end
      '';

    extraPlugins = [
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
