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
      ];
    };

    extraPackages = with pkgs; [ nodePackages.typescript-language-server ];
  };
}
