#!/bin/bash

cd "$(dirname "$0")/loady_mc_loadface"

python3 -m venv .venv

source .venv/bin/activate

pip install -r requirements.txt

python main.py