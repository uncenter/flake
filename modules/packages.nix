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

    # Catppuccin #
    whiskers
    catwalk

    # Image & Video #
    ffmpeg
    imagemagick
    libwebp

    # Language Tools & Runtimes #
    bun
    deno
    fnm
    fortls
    fprettify
    jdk17
    nil
    ruff
    shellcheck
    taplo

    # Tools and TUIs #
    cowsay
    yq
    xh
    doggo
    du-dust
    eza
    fd
    gh
    gum
    hexyl
    hyperfine
    jnv
    jq
    just
    kittysay
    lolcat
    neovim
    nrr
    pastel
    ripgrep
    scc
    sd
    sttr
    silicon
    spicetify-cli
    terminal-notifier
    tokei
    typos
    vhs
    xdg-ninja
  ];
}
