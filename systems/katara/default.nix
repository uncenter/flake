{ ... }:
{
  imports = [ ./icons.nix ];

  glade = {
    cli.enable = true;
    tui.enable = true;
    gui.enable = true;

    media.enable = true;
    data.enable = true;
    networking.enable = true;
    filesystem.enable = true;
    search.enable = true;
    tasks.enable = true;
    misc.enable = true;
    fun.enable = true;

    development.enable = true;
  };

  networking = {
    computerName = "Katara";
    hostName = "katara";
    localHostName = "katara";
  };

  security.pam.enableSudoTouchIdAuth = true;
}
