#!/bin/bash

cd "$(dirname "$0")"

docker run --rm -v $(pwd):/src elixir:1.18 bash -c "/src/build.sh"