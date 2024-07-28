{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "CommitMono"
        "0xProto"
        "Lilex"
      ];
    })
  ];
}
