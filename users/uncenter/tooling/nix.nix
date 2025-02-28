{
  lib,
  pkgs,
  inputs',
  osConfig,
  ...
}:
let
  cfg = osConfig.glade;
in
{
  config = lib.mkIf cfg.tooling.nix.enable {
    home.packages =
      (with pkgs; [
        cachix
        deadnix
        statix
        nil
        nixfmt-rfc-style
        nixpkgs-review
        nix-init
        nix-inspect
        nix-output-monitor
        nix-update
        nurl
        nvd
      ])
      ++ (with inputs'.tgirlpkgs.packages; [
        nixpkgs-track
        nixpkgs-using
      ]);

    programs.nix-your-shell = {
      enable = true;

      enableFishIntegration = true;
      enableNushellIntegration = cfg.shells.nushell.enable;
    };

    xdg.configFile."nix-init/config.toml" = {
      source = (pkgs.formats.toml { }).generate "config.toml" { maintainers = [ "uncenter" ]; };
    };
  };
}
