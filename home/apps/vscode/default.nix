{
  pkgs,
  lib,
  config,
  ...
}: let
  extensions = [
    "astro-build.astro-vscode"
    "bierner.comment-tagged-templates"
    "bierner.emojisense"
    "bierner.github-markdown-preview"
    "bierner.markdown-checkbox"
    "bierner.markdown-emoji"
    "bierner.markdown-footnotes"
    "bierner.markdown-mermaid"
    "bierner.markdown-preview-github-styles"
    "bierner.markdown-yaml-preamble"
    "biomejs.biome"
    "bmalehorn.vscode-fish"
    "bradlc.vscode-tailwindcss"
    "catppuccin.catppuccin-vsc"
    "catppuccin.catppuccin-vsc-icons"
    "charliermarsh.ruff"
    "dbaeumer.vscode-eslint"
    "denoland.vscode-deno"
    "eamodio.gitlens"
    "editorconfig.editorconfig"
    "esbenp.prettier-vscode"
    "fabiospampinato.vscode-open-in-finder"
    "fabiospampinato.vscode-open-in-github"
    "fabiospampinato.vscode-open-in-npm"
    "fortran-lang.linter-gfortran"
    "ginfuru.better-nunjucks"
    "github.vscode-github-actions"
    "golang.go"
    "graphql.vscode-graphql-syntax"
    "griimick.vhs"
    "hyoban.tailwindcss-classname-highlight"
    "jnoortheen.nix-ide"
    "johnnymorganz.stylua"
    "kamadorueda.alejandra"
    "kravets.vscode-publint"
    "leonardssh.vscord"
    "mechatroner.rainbow-csv"
    "meganrogge.template-string-converter"
    "mrmlnc.vscode-scss"
    "ms-python.debugpy"
    "ms-python.python"
    "ms-vscode-remote.remote-wsl"
    "ms-vscode.cpptools"
    "njpwerner.autodocstring"
    "oscarotero.vento-syntax"
    "oven.bun-vscode"
    "ph0enixkm.amber-language"
    "redhat.vscode-yaml"
    "rust-lang.rust-analyzer"
    "sclu1034.justfile"
    "svelte.svelte-vscode"
    "tamasfe.even-better-toml"
    "tauri-apps.tauri-vscode"
    "timonwong.shellcheck"
    "unifiedjs.vscode-mdx"
    "usernamehw.errorlens"
    "visualstudioexptteam.intellicode-api-usage-examples"
    "visualstudioexptteam.vscodeintellicode"
    "vitaliymaz.vscode-svg-previewer"
    "vue.volar"
    "wakatime.vscode-wakatime"
    "yahyabatulu.vscode-markdown-alert"
    "yoavbls.pretty-ts-errors"
    "yzhang.markdown-all-in-one"
    "zguolee.tabler-icons"
  ];

  mkLink = config.lib.file.mkOutOfStoreSymlink;

  settingsFile = mkLink "/Users/uncenter/.config/flake/home/apps/vscode/settings.json";
in {
  programs.vscode = {
    enable = true;
    package = pkgs.stdenv.mkDerivation {
      pname = "vscode";
      version = "1.88.1";
      dontUnpack = true;
      installPhase = ''
        mkdir -p $out
      '';
    };

    extensions = [];
    mutableExtensionsDir = true;
  };

  # Originally from https://github.com/ryanccn/flake/blob/3861c0442b808dc44694ce783e77f4abdcbd087b/home/apps/vscode.nix#L207-L241.
  home.activation = {
    vscodeExtensions = lib.hm.dag.entryAfter ["writeBoundary"] ''
      code_bin="/usr/local/bin/code"

      if ! command -v "$code_bin" &> /dev/null; then
        echo "code CLI is not available"
        exit 0
      fi

      declare -A currentExtensions
      for extension in $("$code_bin" --list-extensions); do
        currentExtensions["$extension"]=1;
      done

      ${builtins.concatStringsSep
        "\n"
        (
          builtins.map
          (ext: ''
            if [[ -z "''${currentExtensions[${ext}]+unset}" ]]; then
              echo "installing ${ext}"
              $DRY_RUN_CMD "$code_bin" --install-extension ${ext} &> /dev/null
            fi
            unset 'currentExtensions[${ext}]'
          '')
          extensions
        )}

      for ext in "''${!currentExtensions[@]}"; do
        echo "uninstalling $ext"
        $DRY_RUN_CMD "$code_bin" --uninstall-extension $ext &> /dev/null
        unset 'currentExtensions[$ext]'
      done
    '';
  };

  home.file."Library/Application Support/Code/User/settings.json".source = settingsFile;
}
