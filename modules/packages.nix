{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
  with inputs.catppuccin-toolbox.packages.${pkgs.system}; [
    inputs.home-manager.packages.${pkgs.system}.home-manager

    # Essentials #
    curl
    git-lfs
    gnupg
    wget

    # Nix #
    alejandra
    statix
    nixpkgs-review
    inputs.nixpkgs-using.packages.${pkgs.system}.default
    inputs.purr.packages.${pkgs.system}.default
    nix-update
    nurl

    # Catppuccin #
    whiskers
    catwalk

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
    nil
    poetry
    python3
    ruff
    shellcheck
    taplo

    # Tools and TUIs #
    cmatrix
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
    jnv
    jq
    just
    kittysay
    license-go
    lolcat
    neovim
    nrr
    ouch
    pastel
    ripgrep
    scc
    sd
    sttr
    spicetify-cli
    terminal-notifier
    tokei
    typos
    vhs
    xdg-ninja
    xsv
  ];
}
