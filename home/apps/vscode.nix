{
  pkgs,
  lib,
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
    "bmalehorn.vscode-fish"
    "bradlc.vscode-tailwindcss"
    "catppuccin.catppuccin-vsc"
    "catppuccin.catppuccin-vsc-icons"
    "charliermarsh.ruff"
    "dbaeumer.vscode-eslint"
    "denoland.vscode-deno"
    "dprint.dprint"
    "eamodio.gitlens"
    "editorconfig.editorconfig"
    "esbenp.prettier-vscode"
    "fabiospampinato.vscode-github-notifications-bell"
    "fabiospampinato.vscode-open-in-finder"
    "fabiospampinato.vscode-open-in-github"
    "fabiospampinato.vscode-open-in-npm"
    "fortran-lang.linter-gfortran"
    "ginfuru.better-nunjucks"
    "github.vscode-github-actions"
    "golang.go"
    "griimick.vhs"
    "hyoban.tailwindcss-classname-highlight"
    "jnoortheen.nix-ide"
    "johnnymorganz.stylua"
    "kamadorueda.alejandra"
    "leonardssh.vscord"
    "mechatroner.rainbow-csv"
    "meganrogge.template-string-converter"
    "mrmlnc.vscode-scss"
    "ms-python.black-formatter"
    "ms-python.debugpy"
    "ms-python.isort"
    "ms-python.python"
    "ms-python.vscode-pylance"
    "ms-vscode-remote.remote-wsl"
    "ms-vscode.cpptools"
    "njpwerner.autodocstring"
    "ocamllabs.ocaml-platform"
    "oscarotero.vento-syntax"
    "oven.bun-vscode"
    "pkief.material-icon-theme"
    "redhat.vscode-yaml"
    "rust-lang.rust-analyzer"
    "sclu1034.justfile"
    "svelte.svelte-vscode"
    "tamasfe.even-better-toml"
    "tauri-apps.tauri-vscode"
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
in {
  programs.vscode = {
    enable = true;
    package = pkgs.stdenv.mkDerivation {
      pname = "vscode";
      version = "1.87.2";
      dontUnpack = true;
      installPhase = ''
        mkdir -p $out
      '';
    };

    extensions = [];
    mutableExtensionsDir = true;

    userSettings = {
      "workbench.iconTheme" = "catppuccin-frappe";
      "workbench.colorTheme" = "Catppuccin Frappé";
      "workbench.preferredDarkColorTheme" = "Catppuccin Frappé";
      "workbench.preferredLightColorTheme" = "Catppuccin Latte";
      "workbench.productIconTheme" = "Tabler";
      "workbench.fontAliasing" = "antialiased";
      "workbench.sideBar.location" = "left";
      "workbench.startupEditor" = "none";
      "window.autoDetectColorScheme" = true;
      "workbench.editor.showTabs" = "multiple";
      "window.nativeTabs" = true;
      "editor.minimap.enabled" = false;

      "editor.fontFamily" = "CommitMono Nerd Font";
      "editor.fontLigatures" = true;
      "editor.fontWeight" = "normal";
      "editor.fontSize" = 14;
      "editor.lineHeight" = 1.5;
      "editor.accessibilitySupport" = "off";
      "editor.inlineSuggest.enabled" = true;
      "editor.detectIndentation" = false;
      "editor.stickyScroll.enabled" = false;
      "editor.linkedEditing" = true;
      "workbench.editor.closeOnFileDelete" = true;
      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.lineHeight" = 1.3;
      "terminal.integrated.cursorBlinking" = true;
      "terminal.integrated.defaultProfile.osx" = "/run/current-system/sw/bin/fish";
      "editor.cursorSmoothCaretAnimation" = "off";

      "editor.formatOnSave" = true;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.tabSize" = 4;
      "prettier.useTabs" = true;

      "[python]" = {
        "editor.formatOnType" = true;
        "editor.defaultFormatter" = "ms-python.black-formatter";
      };
      "yaml.format.enable" = true;
      "[yaml]" = {
        "editor.tabSize" = 2;
      };
      "[github-actions-workflow]" = {
        "editor.tabSize" = 2;
      };
      "fortran.formatting.formatter" = "fprettify";
      "[FortranFreeForm]" = {
        "editor.defaultFormatter" = "fortran-lang.linter-gfortran";
      };
      "[lua]" = {
        "editor.defaultFormatter" = "JohnnyMorganz.stylua";
      };
      "[rust]" = {
        "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        "editor.formatOnSave" = true;
      };

      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.suggestSmartCommit" = false;
      "git.openRepositoryInParentFolders" = "never";

      "files.associations" = {
        "*.njk" = "nunjucks";
      };
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      "explorer.sortOrder" = "type";
      "explorer.fileNesting.enabled" = true;
      "explorer.fileNesting.expand" = false;
    };
  };

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
}
