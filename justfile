_default:
  @just --list --unsorted


[macos]
build *args:
  sudo darwin-rebuild build --flake . {{args}} |& nom
  nvd diff /run/current-system ./result

[linux]
build *args:
  sudo nixos-rebuild build --flake . {{args}} |& nom
  nvd diff /run/current-system ./result

[macos]
switch *args:
  sudo darwin-rebuild switch --flake . {{args}} |& nom

[linux]
switch *args:
  sudo nixos-rebuild switch --flake . {{args}} |& nom

update:
  nix flake update

check:
  nix flake check

clean:
  sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old
  sudo nix-collect-garbage --delete-older-than 3d
