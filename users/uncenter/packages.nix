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
    with inputs'.beapkgs.packages;
    concatLists [
      # Essentials #
      [
        gnupg
      ]

      # Image & Video #
      (optionals cfg.media.enable [
        ffmpeg
        icnsify
        imagemagick
        libwebp
        poppler_utils
      ])

      # Languages and Tooling #
      (optionals cfg.development.enable [
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
      ])

      # Data #
      (optionals cfg.data.enable [
        jnv
        jq
        yq
      ])

      # Networking #
      (optionals cfg.networking.enable [
        curl
        xh
        doggo
        miniserve
        wget
      ])

      # Filesystem #
      (optionals cfg.filesystem.enable [
        entr
        exiftool
        eza
        ouch
        parallel-disk-usage
      ])

      # Search #
      (optionals cfg.search.enable [
        fd
        grex
        ripgrep
        sd
        serpl
        lychee
      ])

      # Tasks #
      (optionals cfg.tasks.enable [
        nrr
        just
      ])

      # Misc #
      (optionals cfg.misc.enable [
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
      ])

      # Fun #
      (optionals cfg.fun.enable [
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
