{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
  with inputs.catppuccin-toolbox.packages.${pkgs.system}; [
    inputs.home-manager.packages.${pkgs.system}.home-manager

    # Shell #
    fish
    starship

    # Essentials #
    bat
    coreutils
    curl
    gcc
    git
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
    ruff
    taplo

    # Tools and TUIs #
    atuin
    bottom
    cowsay
    yq
    xh
    doggo
    du-dust
    eza
    fd
    fzf
    gh
    gum
    hyperfine
    jnv
    jq
    just
    lazygit
    lolcat
    neovim
    newsboat
    nrr
    pastel
    ripgrep
    sd
    silicon
    spicetify-cli
    terminal-notifier
    typos
    vhs
    xdg-ninja
    tokei
    yazi
  ];
}
