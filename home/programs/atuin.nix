_: {
  programs.atuin = {
    enable = true;

    enableFishIntegration = true;
    enableBashIntegration = false;
    enableZshIntegration = false;

    settings = {
      inline_height = 0;
    };
  };
}
