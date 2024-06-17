{
  pkgs,
  config,
  ...
}: let
  mkLink = config.lib.file.mkOutOfStoreSymlink;

  settingsFile = mkLink "/Users/uncenter/.config/flake/home/apps/vscode/settings.json";
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    extensions = with pkgs.vscode-extensions; [
      astro-build.astro-vscode
      bierner.comment-tagged-templates
      bierner.emojisense
      bierner.github-markdown-preview
      bierner.markdown-checkbox
      bierner.markdown-emoji
      bierner.markdown-footnotes
      bierner.markdown-mermaid
      bierner.markdown-preview-github-styles
      bierner.markdown-yaml-preamble
      biomejs.biome
      bmalehorn.vscode-fish
      bradlc.vscode-tailwindcss
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      charliermarsh.ruff
      dbaeumer.vscode-eslint
      denoland.vscode-deno
      eamodio.gitlens
      editorconfig.editorconfig
      esbenp.prettier-vscode
      fabiospampinato.vscode-open-in-github
      fortran-lang.linter-gfortran
      ginfuru.better-nunjucks
      github.vscode-github-actions
      golang.go
      graphql.vscode-graphql-syntax
      griimick.vhs
      hyoban.tailwindcss-classname-highlight
      jnoortheen.nix-ide
      johnnymorganz.stylua
      kamadorueda.alejandra
      kravets.vscode-publint
      leonardssh.vscord
      mechatroner.rainbow-csv
      meganrogge.template-string-converter
      mrmlnc.vscode-scss
      ms-python.debugpy
      ms-python.python
      ms-vscode-remote.remote-wsl
      ms-vscode.cpptools
      njpwerner.autodocstring
      oven.bun-vscode
      redhat.vscode-yaml
      rust-lang.rust-analyzer
      sclu1034.justfile
      svelte.svelte-vscode
      tamasfe.even-better-toml
      timonwong.shellcheck
      unifiedjs.vscode-mdx
      usernamehw.errorlens
      visualstudioexptteam.intellicode-api-usage-examples
      visualstudioexptteam.vscodeintellicode
      vitaliymaz.vscode-svg-previewer
      vue.volar
      wakatime.vscode-wakatime
      yahyabatulu.vscode-markdown-alert
      yoavbls.pretty-ts-errors
      yzhang.markdown-all-in-one
      zguolee.tabler-icons
    ];
    mutableExtensionsDir = true;
  };

  home.file."Library/Application Support/Code/User/settings.json".source = settingsFile;
}
