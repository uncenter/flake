_default:
  @just --list --unsorted

[macos]
switch *args:
  darwin-rebuild switch --flake . {{args}} |& nom

[linux]
switch *args:
  sudo nixos-rebuild switch --flake . {{args}} |& nom

update:
  nix flake update

check:
  nix flake check

clean:
  sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old
  home-manager expire-generations now
  sudo nix-collect-garbage --delete-older-than 3d
