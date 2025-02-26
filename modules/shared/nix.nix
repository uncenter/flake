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
    ];

    config = {
      allowUnfree = true;
      # showDerivationWarnings = ["maintainerless"];
    };
  };
}
