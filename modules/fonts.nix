{
  lib,
  pkgs,
  ...
}: {
  config.fonts = {
    # https://github.com/LnL7/nix-darwin/pull/754
    fontDir.enable = true;

    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "CommitMono"
          "0xProto"
          "CascadiaCode"
        ];
      })
    ];
  };
}
