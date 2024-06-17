{config, ...}: {
  home.file."${config.xdg.configHome}/ghostty/config".source = ./ghostty.conf;
}
