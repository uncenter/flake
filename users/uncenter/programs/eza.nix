{
  programs.eza = {
    enable = true;
    icons = "auto";

    extraOptions = [
      "--no-permissions"
      "--no-user"
      "--ignore-glob"
      ".git"
    ];
  };
}
