{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  programs.halloy = lib.mkIf osConfig.glade.apps.enable {
    enable = true;

    settings = {
      servers.liberachat = {
        channels = [
          "#halloy"
          "#pico.sh"
          "#tangled"
        ];
        nickname = "uncenter";
        nick_password_command = "${pkgs._1password-cli}/bin/op read op://Private/Libera.Chat/password";
        server = "irc.libera.chat";
      };
    };
  };
}
