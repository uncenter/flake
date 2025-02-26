{
  lib,
  pkgs,
  osConfig,
  inputs',
  ...
}:
let
  inherit (lib) optionals concatLists;

  cfg = osConfig.glade;
in
{
  config.home.packages =
    with pkgs;
    with inputs'.tgirlpkgs.packages;
    concatLists [
      [
        home-manager
      ]

      # Essentials #
      [
        gnupg
        jq
        curl
      ]

      # Image & Video #
      (optionals cfg.programs.media.enable [
        ffmpeg
        icnsify
        imagemagick
        libwebp
        poppler_utils
      ])

      # Languages and Tooling #
      (optionals cfg.tooling.enable [
        bun
        cabinpkg
        deno
        dprint
        emscripten
        fnm
        go
        jdk17
        maven
        (taplo.override { withLsp = true; })
        (tree-sitter.override {
          webUISupport = true;
        })
        zig
      ])

      # Data #
      (optionals cfg.programs.data.enable [
        jnv
        yq
      ])

      # Networking #
      (optionals cfg.programs.networking.enable [
        xh
        doggo
        miniserve
        wget
      ])

      # Filesystem #
      (optionals cfg.programs.filesystem.enable [
        entr
        exiftool
        eza
        ouch
        parallel-disk-usage
      ])

      # Search #
      (optionals cfg.programs.search.enable [
        fd
        grex
        ripgrep
        sd
        serpl
        lychee
      ])

      # Tasks #
      (optionals cfg.programs.tasks.enable [
        nrr
        just
      ])

      # Misc #
      (optionals cfg.programs.misc.enable [
        flyctl
        gum
        hexyl
        hyperfine
        ito
        license-go
        pastel
        star-history
        vhs
        (wakatime-cli.overrideAttrs (_: {
          doCheck = false;
        }))
      ])

      # Fun #
      (optionals cfg.programs.fun.enable [
        cmatrix
        cmd-wrapped
        cowsay
        fastfetch
        kittysay
        meower
        lolcat
        scc
        tokei
      ])
    ];
}
