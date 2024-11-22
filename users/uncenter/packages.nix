{ pkgs, inputs, ... }:
{
  home.packages =
    with pkgs;
    with inputs.home-manager.packages.${pkgs.system};
    with inputs.beapkgs.packages.${pkgs.system};
    [
      home-manager

      # Essentials #
      gnupg

      # Nix #
      cachix
      deadnix
      statix
      nil
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
      inputs.catppuccin-whiskers.packages.${pkgs.system}.whiskers
      inputs.catppuccin-catwalk.packages.${pkgs.system}.catwalk
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
      tree-sitter
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
      du-dust
      entr
      exiftool
      eza
      ouch

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
