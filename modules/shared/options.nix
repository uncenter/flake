{ lib, config, ... }:
let
  inherit (lib) mkEnableOption;

  cfg = config.glade;
in
{
  options.glade = {
    cli.enable = mkEnableOption "Enable cli packages" // {
      default = true;
    };

    tui.enable = mkEnableOption "Enable tui packages";
    gui.enable = mkEnableOption "Enable gui packages";

    media.enable = mkEnableOption "Enable media";
    data.enable = mkEnableOption "Enable data";
    networking.enable = mkEnableOption "Enable networking package";
    filesystem.enable = mkEnableOption "Enable filesystem";
    search.enable = mkEnableOption "Enable search";
    tasks.enable = mkEnableOption "Enable tasks";
    misc.enable = mkEnableOption "Enable misc";
    fun.enable = mkEnableOption "Enable fun";

    # development stuff
    development.enable = mkEnableOption "Enable development";

    git.enable = mkEnableOption "Enable git tooling" // {
      default = cfg.development.enable;
    };

    nix.enable = mkEnableOption "Enable nix tooling" // {
      default = cfg.development.enable;
    };

    rust.enable = mkEnableOption "Enable rust tooling" // {
      default = cfg.development.enable;
    };

    gleam.enable = mkEnableOption "Enable gleam tooling" // {
      default = cfg.development.enable;
    };

    python.enable = mkEnableOption "Enable python tooling" // {
      default = cfg.development.enable;
    };
  };
}
