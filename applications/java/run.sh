#!/bin/bash

cd "$(dirname "$0")/loady_mc_loadface"

JAVA_HOME="/opt/homebrew/Cellar/openjdk/24.0.1/libexec/openjdk.jdk/Contents/Home"
PATH="${JAVA_HOME}/bin:${PATH}"

java -jar target/loady_mc_loadface-1.0-SNAPSHOT-jar-with-dependencies.jar