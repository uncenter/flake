#!/usr/bin/env bash

# Create a new branch for a pull request with a random name.
# 'There are only two hard things in Computer Science: cache invalidation and **naming things**.'
# - (supposedly) Phil Karlton
git checkout -b "pr-$(openssl rand -hex 4)"

