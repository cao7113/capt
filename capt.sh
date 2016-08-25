#!/usr/bin/env bash
set -e

# Usage:
#  $0 1604
#  $0 1604-aliyun

function bakup_once(){
  raw=$1
  suffix=capt-origin
  target=$raw.$suffix
  [ -e "$target" ] || {
    mv $raw $target
  } 
}

bakup_once /etc/apt/sources.list
bakup_once /etc/apt/sources.list.d

tag=${1:-1604}
url=${SOURCE_URL:-https://github.com/cao7113/capt/raw/master/share/${tag}-source}

wget -O /etc/apt/sources.list $url
