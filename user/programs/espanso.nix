{
  services.espanso = {
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
