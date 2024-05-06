#!/usr/bin/env bash

FLAKE="/Users/uncenter/.config/flake"
CONFIGURATION="darwinConfigurations.Katara"
USERNAME="uncenter"
REPOSITORY="nixos/nixpkgs"

prs=$(gh pr list --repo "$REPOSITORY" --draft=false --limit 5000 --json "title,number")
packages=$(nix eval --impure --json --expr "(builtins.getFlake \"$FLAKE\").$CONFIGURATION.config.home-manager.users.$USERNAME.home.packages ++ (builtins.getFlake \"$FLAKE\").$CONFIGURATION.config.environment.systemPackages"  --apply "map (pkg: (builtins.parseDrvName pkg.name).name)")
filters=$(echo "$packages" |  jq -r '.[] | "startswith(\"\(.):\")"' | tr '\n' '@' | sed 's/@/ or /g' | rev | cut -c 4- | rev)

echo "$prs" | jq ".[] | select(.title | $filters)" | jq -r "\"\(.title) - https://github.com/$REPOSITORY/pull/\(.number)\""
