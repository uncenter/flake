#!/usr/bin/env bash

REPOSITORY="nixos/nixpkgs"
CONFIGURATION="darwinConfigurations.Katara"

gh pr list --repo "$REPOSITORY" --draft=false --json "title,number" | jq ".[] | select(.title | $(nix eval --json ".#$CONFIGURATION.config.environment.systemPackages"  --apply "map (pkg: (builtins.parseDrvName pkg.name).name)" |  jq -r '.[] | "startswith(\"\(.):\")"' | tr '\n' '@' | sed 's/@/ or /g' | rev | cut -c 4- | rev))" | jq -r '"\(.title) - https://github.com/nixos/nixpkgs/pull/\(.number)"'