{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
  with inputs.home-manager.packages.${pkgs.system};
  with inputs.catppuccin-catwalk.packages.${pkgs.system};
  with inputs.catppuccin-whiskers.packages.${pkgs.system};
  with inputs.beapkgs.packages.${pkgs.system}; [
    home-manager

    # Essentials #
    curl
    git-lfs
    gnupg
    wget

    # Nix #
    alejandra
    deadnix
    statix
    nil
    nixfmt-rfc-style
    nixpkgs-review
    nixpkgs-using
    nix-init
    nix-inspect
    nix-melt
    nix-output-monitor
    nix-update
    nurl

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
    gh
    gitoxide
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
