{
  lib,
  pkgs,
  config,
  osConfig,
  ...
}:
let
  extensions = [
    # Appearance
    "catppuccin.catppuccin-vsc"
    "catppuccin.catppuccin-vsc-icons"
    "zguolee.tabler-icons"

    # Markdown
    "bierner.emojisense"
    "bierner.github-markdown-preview"
    "bierner.markdown-checkbox"
    "bierner.markdown-emoji"
    "bierner.markdown-footnotes"
    "bierner.markdown-mermaid"
    "bierner.markdown-preview-github-styles"
    "yzhang.markdown-all-in-one"

    # Language/Tool Support
    "antfu.unocss"
    "astro-build.astro-vscode"
    "biomejs.biome"
    "bmalehorn.vscode-fish"
    "bradlc.vscode-tailwindcss"
    "charliermarsh.ruff"
    "dbaeumer.vscode-eslint"
    "denoland.vscode-deno"
    "eamodio.gitlens"
    "editorconfig.editorconfig"
    "esbenp.prettier-vscode"
    "fortran-lang.linter-gfortran"
    "github.vscode-github-actions"
    "gleam.gleam"
    "golang.go"
    "graphql.vscode-graphql-syntax"
    "griimick.vhs"
    "jnoortheen.nix-ide"
    "kdl-org.kdl"
    "mechatroner.rainbow-csv"
    "mkhl.direnv"
    "ms-vscode.cpptools" # Required dependency extension for "fortran-lang.linter-gfortran".
    "ms-python.debugpy"
    "ms-python.python"
    "redhat.vscode-yaml"
    "rust-lang.rust-analyzer"
    "nefrob.vscode-just-syntax"
    "svelte.svelte-vscode"
    "tamasfe.even-better-toml"
    "timonwong.shellcheck"
    "uncenter.better-tera"
    "unifiedjs.vscode-mdx"
    "oscarotero.vento-syntax"
    "visualstudioexptteam.intellicode-api-usage-examples"
    "visualstudioexptteam.vscodeintellicode"
    "vue.volar"
    "yoavbls.pretty-ts-errors"

    # Utilities
    "bierner.comment-tagged-templates"
    "vitaliymaz.vscode-svg-previewer"
    "usernamehw.errorlens"
    "meganrogge.template-string-converter"
    "fabiospampinato.vscode-open-in-github"
    "kravets.vscode-publint"
    "njpwerner.autodocstring"
    "ms-vscode-remote.remote-wsl"
    "wakatime.vscode-wakatime"
  ];
in
{
  config = lib.mkIf osConfig.glade.apps.enable {
    programs.vscode = {
      enable = true;
    };

    home =
      let
        mkLink = config.lib.file.mkOutOfStoreSymlink;

        settingsFile = mkLink "${config.home.homeDirectory}/.config/flake/users/uncenter/apps/vscode/settings.json";
      in
      {
        file."Library/Application Support/Code/User/settings.json".source = settingsFile;

        # Originally adapted from https://github.com/ryanccn/flake/blob/b9832c59cf9d0362c2d20f838220bed434a0b45a/home/apps/vscode.nix#L214-L244.
        # Copyright 2023 Ryan Cao
        activation = {
          vscodeExtensions = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            code_cmd="${lib.getExe pkgs.vscode}"

            if ! command -v "$code_cmd" &> /dev/null; then
              echo "`code` command not found at $code_cmd"
              exit 1
            fi

            declare -A currentExtensions
            for extension in $("$code_cmd" --list-extensions); do
              currentExtensions["$extension"]=1;
            done

            ${builtins.concatStringsSep "\n" (
              builtins.map (ext: ''
                if [[ -z "''${currentExtensions[${ext}]+unset}" ]]; then
                  echo "Installing ${ext}..."
                  $DRY_RUN_CMD "$code_cmd" --install-extension ${ext} &> /dev/null
                fi
                unset 'currentExtensions[${ext}]'
              '') extensions
            )}

            for ext in "''${!currentExtensions[@]}"; do
              echo "Uninstalling $ext..."
              $DRY_RUN_CMD "$code_cmd" --uninstall-extension $ext &> /dev/null
              unset 'currentExtensions[$ext]'
            done
          '';
        };
      };
  };
}
