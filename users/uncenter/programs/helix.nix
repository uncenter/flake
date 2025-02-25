{
  lib,
  pkgs,
  inputs,
  inputs',
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.glade.programs.enable {
    programs.helix = {
      enable = true;
      # Custom fork of Helix which includes my favorite pull requests and custom patches on the latest branch.
      # https://github.com/uncenter/helix/tree/patchy
      # Created using https://github.com/NikitaRevenco/patchy.
      package = inputs'.helix.packages.helix;

      settings = {
        editor = {
          soft-wrap.enable = true;
          whitespace.render = {
            space = "all";
            tab = "all";
          };
          bufferline = "multiple";
          true-color = true;
          line-number = "relative";
          lsp = {
            display-messages = true;
            display-inlay-hints = false;
          };
          end-of-line-diagnostics = "hint";
          inline-diagnostics.cursor-line = "error";
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
          taplo = {
            config = { };
          };
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
        };
      };

      extraPackages = with pkgs; [
        # Web Development
        nodePackages.typescript-language-server
        nodePackages.vscode-langservers-extracted
        superhtml
        vue-language-server

        # Java
        jdt-language-server

        # Swift
        sourcekit-lsp

        # Fortran
        fortls
        fprettify

        # Shell
        shellcheck

        # Markdown
        marksman
      ];
    };
  };
}
