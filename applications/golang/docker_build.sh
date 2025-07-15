#!/bin/bash

cd "$(dirname "$0")"

docker run  --rm -v $(pwd):/src golang:bookworm bash -c "/src/build.sh"