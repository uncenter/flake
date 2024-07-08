{pkgs, ...}: let
  tomlFormat = pkgs.formats.toml {};
in {
  xdg.configFile."nix-init/config.toml" = {
    source =
      tomlFormat.generate "config.toml"
      {
        maintainers = [
          "uncenter"
        ];
      };
  };
}
