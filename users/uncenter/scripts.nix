{
  config,
  pkgs,
  lib,
  ...
}:
{
  home = {
    sessionPath = [
      "$GOPATH/bin"
      "$CARGO_HOME/bin"
      "$PNPM_HOME"
      "$GHOSTTY_BIN_DIR"

      "${config.home.homeDirectory}/.local/bin"
    ];

    file = builtins.listToAttrs (
      builtins.map (name: {
        name = ".local/bin/${lib.removeSuffix ".sh" (builtins.baseNameOf name)}";
        value = {
          source = lib.getExe (
            pkgs.writeShellApplication {
              name = builtins.baseNameOf name;
              text = builtins.readFile ./scripts/${name};

              bashOptions = [
                "errexit"
                "pipefail"
              ];
            }
          );
        };
      }) (builtins.attrNames (builtins.readDir ./scripts))
    );
  };
}
