#!/bin/bash

set +a
source ./.env
set -a

host="${APP_RUNNER_USER}@${APP_RUNNER}"
endpoint="http://${APP_RUNNER}:4000"

#----------------------------------------------------------------------------
# Helper functions

function kill_all() {
    ssh "${host}" '~/benchmarks/kill_all.sh'
}

function wait_online() {
  while true; do
    status=$(curl -s -o /dev/null -w "%{http_code}" "${endpoint}")
    if [ "$status" = "200" ]; then
      break
    fi
    sleep 1
  done
}

function benchmark() {
    lang=$1
    cd k6
    # K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT="${lang}.html" k6 run --out json="${lang}.json" script.js
    K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT="../outputs/iteration_1/reports/${lang}.html" k6 run  script.js
    cd -
}

#----------------------------------------------------------------------------
# Build all the applications on the remote side

if [ "${1}" == "--build" ]; then
  ssh "${host}" 'bash /root/benchmarks/build_all.sh'
fi

#----------------------------------------------------------------------------
# Run tests

# Elixir
kill_all
ssh -f "${host}" 'nohup /root/benchmarks/applications/elixir/run.sh > /dev/null & disown'
wait_online
benchmark "elixir"

# Golang
kill_all
ssh -f "${host}" 'nohup /root/benchmarks/applications/golang/run.sh > /dev/null & disown'
wait_online
benchmark "golang"

# Java
kill_all
ssh -f "${host}" 'nohup /root/benchmarks/applications/java/run.sh > /dev/null & disown'
wait_online
benchmark "java"

# Python
kill_all
ssh -f "${host}" 'nohup /root/benchmarks/applications/python/run.sh > /dev/null & disown'
wait_online
benchmark "python"

# Rust
kill_all
ssh -f "${host}" 'nohup /root/benchmarks/applications/rust/run.sh > /dev/null & disown'
wait_online
benchmark "rust"

kill_all