{
  pkgs,
  inputs,
  config,
  ...
}:
{
  nix = {
    package = pkgs.lix;

    registry = {
      n.flake = inputs.nixpkgs;
    };

    nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      warn-dirty = false;
      extra-platforms = [
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      build-users-group = "nixbld";
      trusted-users = [ "uncenter" ];
      sandbox = true;
      use-xdg-base-directories = true;

      substituters = [
        "https://uncenter.cachix.org"

        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
        "https://nixpkgs-unfree.cachix.org"
        "https://numtide.cachix.org"
        "https://catppuccin.cachix.org"
        "https://cache.garnix.io"
      ];

      trusted-public-keys = [
        "uncenter.cachix.org-1:oTEVc2NvAzhiZgE6QiY81ASQDXTAH7roX9i8zA7ub2g="

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
      inputs.catppuccin-vsc.overlays.default
    ];

    config = {
      allowUnfree = true;
      # showDerivationWarnings = ["maintainerless"];
    };
  };
}
