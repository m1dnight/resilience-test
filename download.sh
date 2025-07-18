#!/bin/bash

#----------------------------------------------------------------------------
# Upload to runner

runner=root@34.51.220.94

rsync -rav --progress \
    --filter=':- applications/elixir/loady_mc_loadface/.gitignore' \
    --filter=':- applications/golang/loady_mc_loadface/.gitignore' \
    --filter=':- applications/java/loady_mc_loadface/.gitignore' \
    --filter=':- applications/python/loady_mc_loadface/.gitignore' \
    --filter=':- applications/rust/loady_mc_loadface/.gitignore' \
    --exclude '.git' \
    "${runner}:~/benchmarks/k6/" k6
