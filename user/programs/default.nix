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
  imports = [
    ./atuin.nix
    ./bat.nix
    ./bottom.nix
    ./direnv.nix
    ./espanso.nix
    ./eza.nix
    ./fd.nix
    ./git.nix
    ./glamour.nix
    ./helix.nix
    ./izrss.nix
    ./neovim.nix
    ./spicetify.nix
    ./starship.nix
    ./yazi.nix
  ];

  config.home.packages =
    with pkgs;
    with inputs'.tgirlpkgs.packages;
    concatLists [
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
        vhs
      ])

      # Languages and Tooling #
      (optionals cfg.tooling.enable [
        cabinpkg # C
        go # Go
        # Java
        jdk17
        maven
        (taplo.override { withLsp = true; }) # TOML
        zig # Zig
      ])

      # Data #
      (optionals cfg.programs.data.enable [
        jless
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
        dust
        entr
        exiftool
        ouch
      ])

      # Search #
      (optionals cfg.programs.search.enable [
        fd
        ripgrep
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
        monolith
        star-history
        (tree-sitter.override {
          webUISupport = true;
        })
        (wakatime-cli.overrideAttrs (_: {
          doCheck = false;
        }))
        ratchet
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
        tokei
      ])
    ];
}
