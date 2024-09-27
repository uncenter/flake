{ lib, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    catppuccin.enable = true;

    settings = {
      editor = {
        soft-wrap.enable = true;
        whitespace.render = {
          space = "all";
          tab = "all";
        };
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          formatter = {
            command = lib.getExe pkgs.nixfmt-rfc-style;
          };
          auto-format = true;
        }
        {
          name = "python";
          formatter = {
            command = "ruff";
            args = [
              "format"
              "-"
            ];
          };
          auto-format = true;
        }
        {
          name = "fish";
          formatter = {
            command = "fish_indent";
          };
          auto-format = true;
        }
        {
          name = "swift";
          formatter = {
            command = "swift-format";
            args = [ "format" ];
          };
          auto-format = true;
        }
        {
          name = "toml";
          formatter = {
            command = "taplo";
            args = [
              "format"
              "-"
            ];
          };
          auto-format = true;
        }
        {
          name = "html";
          scope = "source.html";
          roots = [ ];
          file-types = [ "html" ];
          language-servers = [
            {
              name = "superhtml-lsp";
              except-features = [ "format" ];
            }
          ];
        }
      ];

      language-server = {
        deno-lsp = {
          command = "deno";
          args = [ "lsp" ];
          environment.NO_COLOR = "1";
          config.deno = {
            enable = true;
            cacheOnSave = true;
            suggest = {
              completeFunctionCalls = false;
              imports = {
                hosts = {
                  "https://deno.land" = true;
                };
              };
            };
          };
        };
        rust-analyzer = {
          config.check.command = "clippy";
        };
        vscode-json-language-server = {
          config.json.schemas = [
            {
              fileMatch = [
                "tsconfig.json"
                "tsconfig.*.json"
              ];
              url = "https://json.schemastore.org/tsconfig.json";
            }
            {
              fileMatch = [
                "package.json"
              ];
              url = "https://json.schemastore.org/package.json";
            }
          ];
        };
        superhtml-lsp = {
          command = "superhtml";
          args = [ "lsp" ];
        };
      };
    };

    extraPackages = with pkgs; [
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      jdt-language-server
    ];
  };
}
