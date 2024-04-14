{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.programs.silicon = {
    enable = mkEnableOption "Silicon - create beautiful images of your source code";

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

    font = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "Hack; SimSun=31";
      description = ''
        The fallback font list ({option}`--font` argument).
      '';
    };

    theme = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "Dracula";
      description = ''
        The syntax highlighting theme. It can be a theme name or path to a .tmTheme file ({option}`--theme` argument).
      '';
    };

    tab-width = mkOption {
      type = types.int;
      default = 4;
      example = 2;
      description = ''
        Tab width ({option}`--tab-width` argument).
      '';
    };

    line-number = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Hide/show line numbers ({option}`--no-line-number` argument).
      '';
    };

    window-controls = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Hide/show window controls ({option}`--no-window-controls` argument).
      '';
    };

    extraOptions = mkOption {
      type = types.listOf types.str;
      default = [];
      example = ["--no-round-corner"];
      description = ''
        Extra command line options passed to Silicon.
      '';
    };

    package = mkPackageOption pkgs "silicon" {};
  };

  config = let
    cfg = config.programs.silicon;

    args = escapeShellArgs (optionals (cfg.font != null) ["--font" cfg.font] ++ optionals (cfg.theme != null) ["--theme" cfg.theme] ++ optional (!cfg.line-number) "--no-line-number" ++ optional (!cfg.window-controls) "--no-window-controls" ++ cfg.extraOptions);

    optionsAlias = {silicon = "silicon ${args}";};
  in
    mkIf (cfg.enable && config.programs.bat.enable) {
      home.packages = [cfg.package];

      programs.bash.shellAliases = optionsAlias;

      programs.zsh.shellAliases = optionsAlias;

      programs.fish.shellAliases = optionsAlias;

      programs.ion.shellAliases = optionsAlias;

      programs.nushell.shellAliases = optionsAlias;

      home.activation.siliconCache = hm.dag.entryAfter ["linkGeneration"] ''
        (
          verboseEcho "Rebuilding Silicon theme cache"
          cd "$(${lib.getExe pkgs.bat} --config-dir)"
          mkdir -p syntaxes/ &> /dev/null
          run ${lib.getExe pkgs.silicon} --build-cache
        )
      '';
    };
}
