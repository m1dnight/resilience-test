#!/bin/bash

#----------------------------------------------------------------------------
# Upload to the webserver

host=root@34.51.220.94

rsync -rav --progress \
    --filter=':- applications/elixir/loady_mc_loadface/.gitignore' \
    --filter=':- applications/golang/loady_mc_loadface/.gitignore' \
    --filter=':- applications/java/loady_mc_loadface/.gitignore' \
    --filter=':- applications/python/loady_mc_loadface/.gitignore' \
    --filter=':- applications/rust/loady_mc_loadface/.gitignore' \
    --exclude '.git' \
    . "${host}:~/benchmarks"


#----------------------------------------------------------------------------
# Upload to test runner

runner=root@91.99.163.65

rsync -rav --progress \
    --filter=':- applications/elixir/loady_mc_loadface/.gitignore' \
    --filter=':- applications/golang/loady_mc_loadface/.gitignore' \
    --filter=':- applications/java/loady_mc_loadface/.gitignore' \
    --filter=':- applications/python/loady_mc_loadface/.gitignore' \
    --filter=':- applications/rust/loady_mc_loadface/.gitignore' \
    --exclude '.git' \
    . "${runner}:~/benchmarks"
