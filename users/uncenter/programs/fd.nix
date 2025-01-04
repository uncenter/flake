{ lib, osConfig, ... }:
{
  programs.fd = lib.mkIf osConfig.glade.programs.enable {
    enable = true;

    hidden = true;
    ignores = [
      ".Trash"
      ".git"
      "**/node_modules"
      "**/target"
    ];
    extraOptions = [ "--no-ignore-vcs" ];
  };
}
