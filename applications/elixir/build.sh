#!/bin/bash

apt-get update
apt-get install -y ca-certificates

cd "$(dirname "$0")/loady_mc_loadface"

mix deps.get --only prod
MIX_ENV=prod mix compile
MIX_ENV=prod mix assets.deploy
mix phx.gen.release
MIX_ENV=prod mix release --force --overwrite