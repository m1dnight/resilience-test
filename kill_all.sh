#!/bin/bash

netstat -tulpn | awk '/4000/ && /LISTEN/ {split($7, a, "/"); system("kill -9 " a[1])}' > /dev/null