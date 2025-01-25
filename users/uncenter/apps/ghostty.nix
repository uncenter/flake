{
  lib,
  pkgs,
  config,
  osConfig,
  ...
}:
{
  programs.ghostty = lib.mkIf osConfig.glade.apps.enable {
    enable = true;

    # Ghostty package is broken on darwin.
    package =
      let
        ghostty-mock = pkgs.writeShellScriptBin "ghostty-mock" ''
          true
        '';
      in
      ghostty-mock;
    # Creates (invalid) symlink to file from the Ghostty package (which is mocked) in the store, bat fails to launch when it can't properly read the file.
    installBatSyntax = false;

    enableFishIntegration = true;

    settings = {
      theme = "catppuccin-${config.catppuccin.flavor}";
      cursor-color =
        lib.strings.removePrefix "#"
          config.palette.${config.catppuccin.flavor}.colors.overlay1.hex;

      font-family = "Lilex Nerd Font";
      font-size = 15;
      adjust-cell-height = 10;
      window-padding-x = 25;
      window-padding-y = 25;

      macos-titlebar-style = "tabs";

      working-directory = "${config.home.homeDirectory}/Dev";
      window-inherit-working-directory = false;

      copy-on-select = false;
      shell-integration = "detect";
      shell-integration-features = "no-cursor";
      macos-option-as-alt = true;

      keybind = [
        "super+backspace=text:\x15"
        "cmd+shift+d=new_split:down"
        "cmd+shift+r=new_split:right"
      ];
    };
  };
}
