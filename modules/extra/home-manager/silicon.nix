{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.programs.silicon = {
    enable = mkEnableOption "Silicon - create beautiful images of your source code";

    settings = mkOption {
      type = with types; attrsOf (oneOf [bool int str]);
      default = {};
      example = literalExpression ''
        {
          font = "Hack; SimSun=31";
          theme = "Dracula";
          tab-width = 2;
          line-number = false;
          window-controls = false;
        };
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
  in
    mkIf cfg.enable {
      home.packages = [cfg.package];

      xdg.configFile."silicon/config" = mkIf (cfg.settings != {}) {
        text = builtins.concatStringsSep "\n" ((builtins.attrValues (builtins.mapAttrs (name: value:
            if value == true
            then ""
            else
              (
                if value == false
                then "--no-${name}"
                else "--${name} " + escapeShellArgs [value]
              ))
          cfg.settings))
          ++ cfg.extraOptions);
      };

      home.activation.siliconCache = hm.dag.entryAfter ["linkGeneration"] ''
        (
          verboseEcho "Rebuilding Silicon theme cache"
          cd "$(${lib.getExe pkgs.bat} --config-dir)"
          mkdir -p syntaxes/ &> /dev/null
          run ${lib.getExe pkgs.silicon} --build-cache
        )
      '';

      assertions = [
        {
          assertion = config.programs.bat.enable;
          message = "Option programs.bat.enable must be enabled to build Silicon theme cache";
        }
      ];
    };
}
