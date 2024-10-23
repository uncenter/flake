{
  pkgs,
  lib,
  config,
  ...
}:
let
  toml = pkgs.formats.toml { };
in
{
  home.file."${config.xdg.dataHome}/cargo/config.toml".source = toml.generate "config.toml" {
    linker = "${lib.getExe pkgs.clang}";
    rustflags = [
      "-C"
      "link-arg=-fuse-ld=${lib.getExe pkgs.mold}"
    ];
  };

  home.packages = with pkgs; [
    (rust-bin.stable.latest.default.override { extensions = [ "rust-src" ]; })
    rust-analyzer-unwrapped

    cargo-sort
    cargo-bloat
    cargo-watch
    cargo-shear
  ];
}
