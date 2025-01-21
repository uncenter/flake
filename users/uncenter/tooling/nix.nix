{
  lib,
  pkgs,
  inputs',
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.glade.tooling.nix.enable {
    home.packages =
      (with pkgs; [
        cachix
        deadnix
        statix
        nil
        nixd
        nixfmt-rfc-style
        nixpkgs-review
        nix-init
        nix-inspect
        nix-output-monitor
        nix-update
        nix-your-shell
        nurl
        nvd
      ])
      ++ (with inputs'.beapkgs.packages; [
        nixpkgs-track
        nixpkgs-using
      ]);

    xdg.configFile."nix-init/config.toml" = {
      source = (pkgs.formats.toml { }).generate "config.toml" { maintainers = [ "uncenter" ]; };
    };
  };
}
