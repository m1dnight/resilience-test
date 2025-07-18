#!/bin/bash

#----------------------------------------------------------------------------
# Upload to the webserver

set +a
source ./.env
set -a


rsync -rav --progress \
    --filter=':- applications/elixir/loady_mc_loadface/.gitignore' \
    --filter=':- applications/golang/loady_mc_loadface/.gitignore' \
    --filter=':- applications/java/loady_mc_loadface/.gitignore' \
    --filter=':- applications/python/loady_mc_loadface/.gitignore' \
    --filter=':- applications/rust/loady_mc_loadface/.gitignore' \
    --exclude '.git' \
    . "${APP_RUNNER_USER}@${APP_RUNNER}:~/benchmarks"


#----------------------------------------------------------------------------
# Upload to test runner

rsync -rav --progress \
    --filter=':- applications/elixir/loady_mc_loadface/.gitignore' \
    --filter=':- applications/golang/loady_mc_loadface/.gitignore' \
    --filter=':- applications/java/loady_mc_loadface/.gitignore' \
    --filter=':- applications/python/loady_mc_loadface/.gitignore' \
    --filter=':- applications/rust/loady_mc_loadface/.gitignore' \
    --exclude '.git' \
    . "${K6_RUNNER_USER}@${K6_RUNNER}:~/benchmarks"
