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
    jdk17
    lua
    luajitPackages.luarocks
    shellcheck
    taplo

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
    neovim
    nrr
    ouch
    pastel
    ripgrep
    scc
    sd
    spicetify-cli
    terminal-notifier
    tokei
    typos
    vhs
    xdg-ninja
    xsv
  ];
}
