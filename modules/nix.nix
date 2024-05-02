{
  self,
  pkgs,
  inputs,
  config,
  ...
}: {
  services.nix-daemon.enable = true;
  nix.package = pkgs.nixVersions.latest;

  nix.registry = {
    n.flake = inputs.nixpkgs;
  };

  nix.nixPath = [
    "nixpkgs=${inputs.nixpkgs.outPath}"
  ];

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
    extra-platforms = ["x86_64-darwin" "aarch64-darwin"];

    build-users-group = "nixbld";
    trusted-users = ["uncenter"];
    sandbox = true;
    use-xdg-base-directories = true;

    nix-path = config.nix.nixPath;
  };

  nixpkgs = {
    overlays = [
      inputs.rust-overlay.overlays.default
    ];

    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
}
