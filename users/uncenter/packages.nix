{ pkgs, inputs, ... }:
{
  home.packages =
    with pkgs;
    with inputs.home-manager.packages.${pkgs.system};
    with inputs.beapkgs.packages.${pkgs.system};
    [
      home-manager

      # Essentials #
      curl
      git-lfs
      gnupg
      wget
      mommy

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

      # Language Tools & Runtimes #
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

      # Tools and TUIs #
      cmatrix
      cmd-wrapped
      cowsay
      yq
      xh
      doggo
      du-dust
      entr
      exiftool
      eza
      fastfetch
      fd
      flyctl
      gfold
      gh
      gitoxide
      grex
      gum
      hael
      hexyl
      hyperfine
      ito
      jnv
      jq
      just
      kittysay
      license-go
      lolcat
      lychee
      meower
      miniserve
      nrr
      ouch
      pastel
      ripgrep
      scc
      sd
      serpl
      star-history
      tokei
      vhs
      wakatime-cli
      xdg-ninja
    ];
}
