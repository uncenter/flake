#!/usr/bin/env bash

REPOSITORY="nixos/nixpkgs"
CONFIGURATION="darwinConfigurations.Katara"

gh pr list --repo "$REPOSITORY" --draft=false --json "title,number" | jq ".[] | select(.title | $(nix eval --json ".#$CONFIGURATION.config.environment.systemPackages" | jq -r '.[] | capture("/nix/store/[A-Za-z0-9]+-(?<package>[A-Za-z-]+)(?![0-9])") | .package' | awk '{printf "%scontains(\"%s:\")", (NR>1 ? " or " : ""), $0} END{print ""}'))"