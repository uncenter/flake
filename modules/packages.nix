{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
  with inputs.catppuccin-toolbox.packages.${pkgs.system}; [
    inputs.home-manager.packages.${pkgs.system}.home-manager

    # Essentials #
    coreutils
    curl
    gcc
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
    hyperfine
    jnv
    jq
    just
    lolcat
    neovim
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
  ];
}
