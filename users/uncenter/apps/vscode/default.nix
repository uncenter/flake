{
  pkgs,
  config,
  lib,
  ...
}:
let
  mkLink = config.lib.file.mkOutOfStoreSymlink;

  settingsFile = mkLink "${config.home.homeDirectory}/.config/flake/users/uncenter/apps/vscode/settings.json";
in
{
  config = lib.mkIf pkgs.stdenv.isDarwin {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;

      extensions = with pkgs.vscode-extensions; [
        # Appearance
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        zguolee.tabler-icons

        # Markdown
        bierner.emojisense
        bierner.github-markdown-preview
        bierner.markdown-checkbox
        bierner.markdown-emoji
        bierner.markdown-footnotes
        bierner.markdown-mermaid
        bierner.markdown-preview-github-styles
        yzhang.markdown-all-in-one

        # Language/Tool Support
        astro-build.astro-vscode
        biomejs.biome
        bmalehorn.vscode-fish
        bradlc.vscode-tailwindcss
        charliermarsh.ruff
        dbaeumer.vscode-eslint
        denoland.vscode-deno
        eamodio.gitlens
        editorconfig.editorconfig
        esbenp.prettier-vscode
        fortran-lang.linter-gfortran
        github.vscode-github-actions
        golang.go
        graphql.vscode-graphql-syntax
        griimick.vhs
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        ms-python.debugpy
        ms-python.python
        redhat.vscode-yaml
        rust-lang.rust-analyzer
        nefrob.vscode-just-syntax
        svelte.svelte-vscode
        tamasfe.even-better-toml
        timonwong.shellcheck
        unifiedjs.vscode-mdx
        visualstudioexptteam.intellicode-api-usage-examples
        visualstudioexptteam.vscodeintellicode
        vue.volar
        yoavbls.pretty-ts-errors

        # Utilities
        bierner.comment-tagged-templates
        vitaliymaz.vscode-svg-previewer
        usernamehw.errorlens
        meganrogge.template-string-converter
        fabiospampinato.vscode-open-in-github
        kravets.vscode-publint
        njpwerner.autodocstring
        ms-vscode-remote.remote-wsl
      ];
      mutableExtensionsDir = true;
    };

    home.file."Library/Application Support/Code/User/settings.json".source = settingsFile;
  };
}
