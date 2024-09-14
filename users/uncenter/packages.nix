{ pkgs, inputs, ... }:
{
  home.packages =
    with pkgs;
    with inputs.home-manager.packages.${pkgs.system};
    with inputs.catppuccin-catwalk.packages.${pkgs.system};
    with inputs.catppuccin-whiskers.packages.${pkgs.system};
    with inputs.beapkgs.packages.${pkgs.system};
    [
      home-manager

      # Essentials #
      curl
      git-lfs
      gnupg
      wget

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
      whiskers
      catwalk
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
      fnm
      fortls
      fprettify
      go
      jdk17
      lua
      luajitPackages.luarocks
      shellcheck
      sourcekit-lsp
      taplo
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
      gfold
      gh
      gitoxide
      grex
      gum
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
      nrr
      ouch
      pastel
      ripgrep
      scc
      sd
      serpl
      tokei
      typos
      vhs
      xdg-ninja
      xsv
    ];
}
