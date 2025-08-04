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
        server = "irc.libera.chat";
        channels = [
          "#halloy"
          "#pico.sh"
          "#tangled"
        ];

        nickname = "uncenter";
        sasl.plain = {
          username = "uncenter";
          password_command = "${pkgs._1password-cli}/bin/op read op://Private/Libera.Chat/password";
        };
      };

      buffer.channel.topic.enabled = true; # show topic banner

      # single pane: https://halloy.chat/guides/single-pane.html
      actions = {
        buffer = {
          click_channel_name = "replace-pane";
          click_highlight = "replace-pane";
          click_username = "replace-pane";
          local = "replace-pane";
          message_channel = "replace-pane";
          message_user = "replace-pane";
        };
        sidebar = {
          buffer = "replace-pane";
        };
      };
    };
  };
}
