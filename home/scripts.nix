{
  config,
  pkgs,
  lib,
  ...
}: {
  home = {
    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
    ];

    file =
      builtins.listToAttrs (builtins.map (name: {
        name = ".local/bin/${lib.removeSuffix ".sh" (builtins.baseNameOf name)}";
        value = {
          source = lib.getExe (pkgs.writeShellApplication {
            name = builtins.baseNameOf name;
            text = builtins.readFile ./scripts/${name};

            bashOptions = ["errexit" "pipefail"];
          });
        };
      }) (builtins.attrNames (builtins.readDir ./scripts)))
      // {
        ".local/bin/wifi-password".source = "${pkgs.fetchFromGitHub {
          owner = "uncenter";
          repo = "wifi-password";
          rev = "f4251aa27c18c6f9f96a30d1e6e5f6d759833242";
          sha256 = "sha256-+gefSWagzydDMQhuG26/iNam+4JNAcpB3qqZDh/TjEs=";
        }}/wifi-password.sh";
      };
  };
}
