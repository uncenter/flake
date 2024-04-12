_: {
  programs.eza = {
    enable = true;
    icons = true;

    extraOptions = ["--no-permissions" "--no-user" "--ignore-glob" ".git"];
  };
}
