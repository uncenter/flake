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
      language =
        let
          lang-to-ext = {
            javascript = "js";
            json = "json";
            markdown = "md";
            typescript = "ts";
            jsx = "jsx";
            tsx = "tsx";
          };
        in
        [
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
        ]
        ++ (lib.attrsets.mapAttrsToList (lang: ext: {
          auto-format = true;
          name = lang;
          roots = [
            "deno.json"
            "deno.jsonc"
          ];
          formatter = {
            args = [
              "fmt"
              "-"
              "--ext"
              ext
            ];
            command = "deno";
          };
        }) lang-to-ext)
        ++ (lib.attrsets.mapAttrsToList (lang: ext: {
          name = lang;
          shebangs = [
            "deno"
          ];
          roots = [
            "deno.json"
            "deno.jsonc"
          ];
          file-types = [
            ext
          ];
          language-servers = [
            "deno-lsp"
          ];
          auto-format = true;
        }) lang-to-ext);

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
      };
    };

    extraPackages = with pkgs; [ nodePackages.typescript-language-server ];
  };
}
