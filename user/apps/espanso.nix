{ lib, osConfig, ... }:
{
  services.espanso = lib.mkIf osConfig.glade.apps.enable {
    enable = true;

    matches = {
      base = {
        matches = [
          {
            trigger = ":m-";
            replace = "—";
          }
        ];
      };
    };

    configs = {
      default = {
        show_icon = false;
      };
    };
  };
}
