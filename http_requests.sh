#!/bin/bash

# Elixir
cd "$(dirname "$0")"

function wait_online() {
  while true; do
    status=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:4000)
    if [ "$status" = "200" ]; then
      break
    fi
    sleep 1
  done
}

function kill_all() {
    kill -9 $(lsof -ti tcp:4000) 2>/dev/null
}

# Elixir
cd applications/elixir && ./build.sh && ./run.sh & cd -

wait_online

curl -vv http://localhost:4000 &> iteration_1/http_request_outputs/elixir.txt
kill_all

# Golang
cd applications/golang && ./build.sh && ./run.sh & cd -

wait_online

curl -vv http://localhost:4000 &> iteration_1/http_request_outputs/golang.txt
kill_all

# Java
cd applications/java && ./build.sh && ./run.sh & cd -

wait_online

curl -vv http://localhost:4000 &> iteration_1/http_request_outputs/java.txt
kill_all

# Python
cd applications/python && ./build.sh && ./run.sh & cd -

wait_online

curl -vv http://localhost:4000 &> iteration_1/http_request_outputs/python.txt
kill_all

# Rust
cd applications/rust && ./build.sh && ./run.sh & cd -

wait_online

curl -vv http://localhost:4000 &> iteration_1/http_request_outputs/rust.txt
kill_all