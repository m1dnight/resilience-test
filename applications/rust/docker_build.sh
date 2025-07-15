#!/bin/bash

cd "$(dirname "$0")"

docker run  --rm -v $(pwd):/src rust:1-bullseye bash -c "/src/build.sh"