{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.glade.tooling.rust.enable {
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
      cargo-edit
      cargo-expand
      cargo-binstall
      cargo-insta

      bacon
      mdbook
    ];
  };
}
