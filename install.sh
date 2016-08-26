#!/usr/bin/env bash
set -e

# Usage:
#  $0 [aliyun]

function bakup_once(){
  raw=$1
  suffix=capt.bak
  target=$raw.$suffix
  [ -e "$target" ] || {
    sudo mv $raw $target
  } 
}

bakup_once /etc/apt/sources.list
#bakup_once /etc/apt/sources.list.d

version=$(lsb_release -rs)
# 移除可能的dot, 16.04 --> 1604
tag=${version//.}
if [ $# -gt 0 ]; then
  tag=$tag-$1
fi
url=${SOURCE_URL:-https://github.com/cao7113/capt/raw/master/share/${tag}-source}
echo == get source from: $url

sudo wget -O /etc/apt/sources.list $url
sudo apt-get update

echo ==finished change sources
