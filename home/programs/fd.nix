{
  imports = [../../modules/extra/home-manager/fd.nix];
  config.programs.fd = {
    enable = true;

    enableFishIntegration = true;

    hidden = true;

    ignores = [".Trash" ".git" "**/node_modules" "**/target"];

    extraOptions = ["--no-ignore-vcs"];
  };
}
