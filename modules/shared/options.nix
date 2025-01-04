{ lib, config, ... }:
let
  inherit (lib) mkEnableOption;

  cfg = config.glade;
in
{
  options.glade = {
    programs = {
      enable = mkEnableOption "Enable cli/tui packages" // {
        default = true;
      };

      media.enable = mkEnableOption "Enable media" // {
        default = cfg.programs.enable;
      };

      data.enable = mkEnableOption "Enable data" // {
        default = cfg.programs.enable;
      };

      networking.enable = mkEnableOption "Enable networking" // {
        default = cfg.programs.enable;
      };

      filesystem.enable = mkEnableOption "Enable filesystem" // {
        default = cfg.programs.enable;
      };

      search.enable = mkEnableOption "Enable search" // {
        default = cfg.programs.enable;
      };

      tasks.enable = mkEnableOption "Enable tasks" // {
        default = cfg.programs.enable;
      };

      misc.enable = mkEnableOption "Enable misc" // {
        default = cfg.programs.enable;
      };

      fun.enable = mkEnableOption "Enable fun" // {
        default = cfg.programs.enable;
      };
    };

    apps.enable = mkEnableOption "Enable gui packages";

    # development stuff
    tooling = {
      enable = mkEnableOption "Enable development tooling";

      git.enable = mkEnableOption "Enable git tooling" // {
        default = cfg.tooling.enable;
      };

      nix.enable = mkEnableOption "Enable nix tooling" // {
        default = cfg.tooling.enable;
      };

      rust.enable = mkEnableOption "Enable rust tooling" // {
        default = cfg.tooling.enable;
      };

      gleam.enable = mkEnableOption "Enable gleam tooling" // {
        default = cfg.tooling.enable;
      };

      python.enable = mkEnableOption "Enable python tooling" // {
        default = cfg.tooling.enable;
      };
    };
  };
}
