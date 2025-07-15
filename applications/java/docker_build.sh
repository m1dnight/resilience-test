#!/bin/bash

cd "$(dirname "$0")"

docker run  --rm  -e DEBIAN_FRONTEND='noninteractive' -v $(pwd):/src openjdk:21-bookworm  bash -c "apt-get update && apt-get -y install maven && /src/build.sh"