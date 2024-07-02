{
  pkgs,
  inputs,
  config,
  ...
}: {
  services.nix-daemon.enable = true;
  nix = {
    package = pkgs.nixVersions.nix_2_18;

    registry = {
      n.flake = inputs.nixpkgs;
    };

    nixPath = [
      "nixpkgs=${inputs.nixpkgs.outPath}"
    ];

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      extra-platforms = ["x86_64-darwin" "aarch64-darwin"];

      build-users-group = "nixbld";
      trusted-users = ["uncenter"];
      sandbox = true;
      use-xdg-base-directories = true;

      substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
        "https://nixpkgs-unfree.cachix.org"
        "https://numtide.cachix.org"
        "https://catppuccin.cachix.org"
        "https://cache.garnix.io"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
        "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
        "catppuccin.cachix.org-1:noG/4HkbhJb+lUAdKrph6LaozJvAeEEZj4N732IysmU="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];

      nix-path = config.nix.nixPath;
    };
  };

  nixpkgs = {
    overlays = [
      inputs.rust-overlay.overlays.default
      inputs.beapkgs.overlays.default
    ];

    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
}
