#!/bin/bash

cd "$(dirname "$0")"

cd applications/js && ./setup.sh > /dev/null 2> /dev/null || echo "failed to setup js" ; cd -
cd applications/python && ./setup.sh > /dev/null 2> /dev/null || echo "failed to setup python" ; cd -

cd applications/elixir && ./docker_build.sh > /dev/null 2> /dev/null || echo "failed to build elixir" ; cd -
cd applications/golang && ./docker_build.sh > /dev/null 2> /dev/null || echo "failed to build golang" ; cd -
cd applications/java   && ./docker_build.sh > /dev/null 2> /dev/null || echo "failed to build java" ; cd -
cd applications/rust   && ./docker_build.sh > /dev/null 2> /dev/null || echo "failed to build rust" ; cd -