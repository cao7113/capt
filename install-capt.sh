#!/usr/bin/env bash
set -e
script_url=${1:-https://github.com/cao7113/capt/raw/master/install.sh}
curl -sSL --no-sessionid $script_url | bash
echo ==installed capt, try it!
