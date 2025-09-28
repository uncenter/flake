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
  };
}
