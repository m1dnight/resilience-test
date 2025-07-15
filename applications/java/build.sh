#!/bin/bash

cd "$(dirname "$0")/loady_mc_loadface"

unset M2_HOME
mvn clean package