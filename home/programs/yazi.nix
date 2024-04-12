_: {
  programs.yazi = {
    enable = true;
    catppuccin.enable = true;

    enableFishIntegration = true;

    settings = {
      manager = {
        ratio = [2 3 3];
        sort_by = "alphabetical";
        sort_sensitive = true;
        sort_reverse = true;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
      };
      preview = {
        tab_size = 4;
      };
    };

    keymap = {
      manager.append_keymap = [
        {
          on = ["<Space>"];
          run = ["select --state=none"];
          desc = "Toggle the current selection state";
        }
      ];
    };
  };
}
