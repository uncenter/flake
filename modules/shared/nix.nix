{
  pkgs,
  inputs,
  ...
}:
{
  nix = {
    registry = {
      n.flake = inputs.nixpkgs;
    };

    package = pkgs.lixPackageSets.stable.lix;

    nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];

    gc = {
      automatic = true;
      options = "--delete-older-than 3d";
    };

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = !pkgs.stdenv.hostPlatform.isDarwin;
      warn-dirty = false;
      extra-platforms = [
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      build-users-group = "nixbld";
      trusted-users = [ "uncenter" ];
      sandbox = false;
      use-xdg-base-directories = true;
    };
  };

  nixpkgs = {
    overlays = [
      inputs.rust-overlay.overlays.default

      (final: prev: {
        inherit (inputs.nixpkgs-tree-sitter-webui.legacyPackages.${prev.system})
          tree-sitter
          ;
      })
    ];

    config = {
      allowUnfree = true;
      # showDerivationWarnings = ["maintainerless"];
    };
  };
}
