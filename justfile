switch *args:
  darwin-rebuild switch --flake . --verbose --show-trace {{args}}

delete-old:
  sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && home-manager expire-generations now 

update:
  nix flake update

gc:
  nix store gc
