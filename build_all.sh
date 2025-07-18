#!/bin/bash

root=$(readlink --canonicalize $(dirname "$0"))

cd "${root}" ; echo "setup js"     ; cd applications/js     && ./setup.sh > /dev/null 2> /dev/null || echo "failed to setup js"
cd "${root}" ; echo "setup python" ; cd applications/python && ./setup.sh > /dev/null 2> /dev/null || echo "failed to setup python"

cd "${root}" ; echo "building elixir" ; cd applications/elixir && ./docker_build.sh > /dev/null 2> /dev/null || echo "failed to build elixir"
cd "${root}" ; echo "building golang" ; cd applications/golang && ./docker_build.sh > /dev/null 2> /dev/null || echo "failed to build golang"
cd "${root}" ; echo "building java"   ; cd applications/java   && ./docker_build.sh > /dev/null 2> /dev/null || echo "failed to build java"
cd "${root}" ; echo "building rust"   ; cd applications/rust   && ./docker_build.sh > /dev/null 2> /dev/null || echo "failed to build rust"