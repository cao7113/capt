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
    sudo mv $raw $target
  } 
}

bakup_once /etc/apt/sources.list
bakup_once /etc/apt/sources.list.d

tag=${1:-1604}
# todo 移除可能的dot .
url=${SOURCE_URL:-https://github.com/cao7113/capt/raw/master/share/${tag}-source}

sudo wget -O /etc/apt/sources.list $url
