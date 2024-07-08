{
  programs.fd = {
    enable = true;

    hidden = true;
    ignores = [".Trash" ".git" "**/node_modules" "**/target"];
    extraOptions = ["--no-ignore-vcs"];
  };
}
