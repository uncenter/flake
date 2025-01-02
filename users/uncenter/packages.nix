{ pkgs, inputs', ... }:
{
  home.packages =
    with pkgs;
    with inputs'.home-manager.packages;
    with inputs'.beapkgs.packages;
    [
      home-manager

      # Essentials #
      gnupg

      # Nix #
      cachix
      deadnix
      statix
      nixd
      nixfmt-rfc-style
      nixpkgs-review
      nixpkgs-track
      nixpkgs-using
      nix-init
      nix-inspect
      nix-output-monitor
      nix-update
      nix-your-shell
      nurl
      nvd

      # Catppuccin #
      inputs'.catppuccin.packages.whiskers
      inputs'.catppuccin.packages.catwalk
      purr

      # Image & Video #
      ffmpeg
      icnsify
      imagemagick
      libwebp
      poppler_utils

      # Languages and Tooling #
      bun
      deno
      dprint
      emscripten
      fnm
      go
      jdk17
      maven
      lua
      luajitPackages.luarocks
      (taplo.override { withLsp = true; })
      (tree-sitter.override {
        webUISupport = true;
      })
      zig

      # Data #
      jnv
      jq
      yq

      # Networking #
      curl
      xh
      doggo
      miniserve
      wget

      # Filesystem #
      entr
      exiftool
      eza
      ouch
      parallel-disk-usage

      # Search #
      fd
      grex
      ripgrep
      sd
      serpl
      lychee

      # Tasks #
      nrr
      just

      # Git #
      gfold
      gh
      gitoxide
      git-lfs
      jujutsu
      lazyjj

      # Misc #
      flyctl
      gum
      hexyl
      hyperfine
      ito
      license-go
      pastel
      star-history
      vhs
      wakatime-cli

      # Fun #
      cmatrix
      cmd-wrapped
      cowsay
      fastfetch
      kittysay
      meower
      lolcat
      scc
      tokei
    ];
}
