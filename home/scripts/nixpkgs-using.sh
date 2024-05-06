#!/usr/bin/env bash

REPOSITORY="nixos/nixpkgs"
CONFIGURATION="darwinConfigurations.Katara"

prs=$(gh pr list --repo "$REPOSITORY" --draft=false --json "title,number")
packages=$(nix eval --json ".#$CONFIGURATION.config.environment.systemPackages"  --apply "map (pkg: (builtins.parseDrvName pkg.name).name)")
filters=$(echo "$packages" |  jq -r '.[] | "startswith(\"\(.):\")"' | tr '\n' '@' | sed 's/@/ or /g' | rev | cut -c 4- | rev)

echo "$prs" | jq ".[] | select(.title | $filters)" | jq -r "\"\(.title) - https://github.com/$REPOSITORY/pull/\(.number)\""
