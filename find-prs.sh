#!/usr/bin/env bash

gh pr list --repo nixos/nixpkgs --draft=false --json "title,number" | jq ".[] | select(.title | $(nix eval --json '.#darwinConfigurations.Katara.config.environment.systemPackages' | jq -r '.[] | capture("/nix/store/[A-Za-z0-9]+-(?<package>[A-Za-z-]+)(?![0-9])") | .package' | awk '{printf "%scontains(\"%s:\")", (NR>1 ? " or " : ""), $0} END{print ""}'))"