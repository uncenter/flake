{ lib, config, ... }:
let
  inherit (lib) mkEnableOption;

  cfg = config.glade;
in
{
  options.glade = {
    programs = {
      enable = mkEnableOption "Enable CLI/TUI programs" // {
        default = true;
      };

      media.enable = mkEnableOption "Enable media-related programs" // {
        default = cfg.programs.enable;
      };

      data.enable = mkEnableOption "Enable data-related programs" // {
        default = cfg.programs.enable;
      };

      networking.enable = mkEnableOption "Enable networking-related programs" // {
        default = cfg.programs.enable;
      };

      filesystem.enable = mkEnableOption "Enable filesystem-related programs" // {
        default = cfg.programs.enable;
      };

      search.enable = mkEnableOption "Enable search-related programs" // {
        default = cfg.programs.enable;
      };

      tasks.enable = mkEnableOption "Enable scripts/tasks programs" // {
        default = cfg.programs.enable;
      };

      misc.enable = mkEnableOption "Enable miscellaneous programs" // {
        default = cfg.programs.enable;
      };

      fun.enable = mkEnableOption "Enable fun programs" // {
        default = cfg.programs.enable;
      };
    };

    shells = {
      enable = mkEnableOption "Enable (other) shell programs" // {
        default = true;
      };

      bash.enable = mkEnableOption "Enable Bash" // {
        default = cfg.shells.enable;
      };

      nushell.enable = mkEnableOption "Enable Nushell" // {
        default = cfg.shells.enable;
      };
    };

    apps.enable = mkEnableOption "Enable GUI apps";

    tooling = {
      enable = mkEnableOption "Enable development tooling";

      git.enable = mkEnableOption "Enable Git tooling" // {
        default = cfg.tooling.enable;
      };

      gleam.enable = mkEnableOption "Enable Gleam tooling" // {
        default = cfg.tooling.enable;
      };

      lua.enable = mkEnableOption "Enable Lua/Luau tooling" // {
        default = cfg.tooling.enable;
      };

      nix.enable = mkEnableOption "Enable Nix tooling" // {
        default = cfg.tooling.enable;
      };

      python.enable = mkEnableOption "Enable Python tooling" // {
        default = cfg.tooling.enable;
      };

      rust.enable = mkEnableOption "Enable Rust tooling" // {
        default = cfg.tooling.enable;
      };
    };
  };
}
