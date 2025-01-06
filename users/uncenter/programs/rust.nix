{
  lib,
  pkgs,
  config,
  osConfig,
  ...
}:
let
  toml = pkgs.formats.toml { };
in
{
  config = lib.mkIf osConfig.glade.tooling.rust.enable {
    home.file."${config.xdg.dataHome}/cargo/config.toml".source = toml.generate "config.toml" {
      linker = lib.getExe pkgs.clang;
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
      cargo-tally
      cargo-modules
      cargo-flamegraph

      bacon
      mdbook
    ];
  };
}
