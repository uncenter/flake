{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  programs.helix = {
    enable = true;

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
          display-inlay-hints = true;
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
          language-servers = [
            "nixd"
          ];
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

        {
          name = "tera";
          scope = "source.tera";
          injection-regex = "tera";
          file-types = [ "tera" ];
          grammar = "tera";
          block-comment-tokens = [
            {
              start = "{#";
              end = "#}";
            }
            {
              start = "{#-";
              end = "-#}";
            }
            {
              start = "{#";
              end = "-#}";
            }
            {
              start = "{#-";
              end = "#}";
            }
          ];
          auto-pairs = {
            "(" = ")";
            "[" = "]";
            "\"" = "\"";
            "'" = "'";
            "`" = "`";
            "{" = "}";
            "%" = "%";
          };
        }

        # Wakatime
        {
          name = "rust";
          language-servers = [
            "rust-analyzer"
            "wakatime"
          ];
        }
        {
          name = "c";
          language-servers = [
            "clangd"
            "wakatime"
          ];
        }
        {
          name = "javascript";
          language-servers = [
            "typescript-language-server"
            "wakatime"
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
        superhtml-lsp = {
          command = "superhtml";
          args = [ "lsp" ];
        };
        wakatime = {
          command = "wakatime-ls";
        };
        nixd = {
          command = "nixd";
        };
      };

      grammar = [
        {
          name = "tera";
          source = {
            path = "/Users/uncenter/Dev/Projects/tree-sitter-tera";
          };
        }
      ];
    };

    extraPackages = with pkgs; [
      # Web Development
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      superhtml

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

      inputs.wakatime-ls.packages.${pkgs.system}.wakatime-ls
    ];
  };
}
