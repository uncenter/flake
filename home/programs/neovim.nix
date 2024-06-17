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
    };
  };
}
