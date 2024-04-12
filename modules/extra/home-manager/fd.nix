{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.programs.fd = {
    enable = mkEnableOption "fd, a simple, fast and user-friendly alternative to {command}`find`";

    enableBashIntegration =
      mkEnableOption "Bash integration"
      // {
        default = true;
      };

    enableZshIntegration =
      mkEnableOption "Zsh integration"
      // {
        default = true;
      };

    enableFishIntegration =
      mkEnableOption "Fish integration"
      // {
        default = true;
      };

    enableIonIntegration =
      mkEnableOption "Ion integration"
      // {
        default = true;
      };

    enableNushellIntegration = mkEnableOption "Nushell integration";

    ignores = mkOption {
      type = types.listOf types.str;
      default = [];
      example = [".git/" "*.bak"];
      description = "List of paths that should be globally ignored.";
    };

    hidden = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Search hidden files and directories ({option}`--hidden` argument).
      '';
    };

    extraOptions = mkOption {
      type = types.listOf types.str;
      default = [];
      example = ["--no-ignore" "--absolute-path"];
      description = ''
        Extra command line options passed to fd.
      '';
    };

    package = mkPackageOption pkgs "fd" {};
  };

  config = let
    cfg = config.programs.fd;

    args = escapeShellArgs (optional cfg.hidden "--hidden" ++ cfg.extraOptions);

    optionsAlias = {fd = "fd ${args}";};
  in
    mkIf cfg.enable {
      home.packages = [cfg.package];

      programs.bash.shellAliases = optionsAlias;

      programs.zsh.shellAliases = optionsAlias;

      programs.fish.shellAliases = optionsAlias;

      programs.ion.shellAliases = optionsAlias;

      programs.nushell.shellAliases = optionsAlias;

      xdg.configFile."fd/ignore" = mkIf (cfg.ignores != []) {
        text = concatStringsSep "\n" cfg.ignores + "\n";
      };
    };
}
