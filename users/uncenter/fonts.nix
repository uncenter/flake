{ pkgs, ... }:
{
  home.packages = with pkgs; [
    departure-mono

    (nerdfonts.override {
      fonts = [
        "CommitMono"
        "0xProto"
        "Lilex"
      ];
    })
  ];
}
