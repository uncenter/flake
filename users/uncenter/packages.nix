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
      (optionals cfg.programs.data.enable [
        jnv
        jq
        yq
      ])

      # Networking #
      (optionals cfg.programs.networking.enable [
        curl
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
        wakatime-cli
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
