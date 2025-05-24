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
      inputs.catppuccin-vsc.overlays.default
      (final: prev: {
        emscripten = prev.emscripten.overrideAttrs (attrs: {
          patches = (attrs.patches or [ ]) ++ [
            # These patches are needed to fix issues with overriding EM_CACHE, see https://github.com/NixOS/nixpkgs/issues/409511#issuecomment-2906258234.
            (final.fetchpatch {
              url = "https://github.com/emscripten-core/emscripten/commit/99c6e41154f701e423074e33a4fdaf5eea49d073.patch";
              hash = "sha256-/wkhz08NhbgxsrXd7YFfdCGX6LrS2Ncct8dcwxBMsjY=";
            })
            (final.fetchpatch {
              url = "https://github.com/emscripten-core/emscripten/commit/f4d358d740a238b67a1d6935e71638519d25afa0.patch";
              hash = "sha256-hib5ZAN/R2dH+rTv3nYF37+xKZmeboKxnS+5mkht2lM=";
            })
          ];
        });
      })
    ];

    config = {
      allowUnfree = true;
      # showDerivationWarnings = ["maintainerless"];
    };
  };
}
