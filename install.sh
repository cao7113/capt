#!/usr/bin/env bash
set -e

# $0 [aliyun]
# UBUNTU_VERSION=1604 $0 

sudo_cmd=''
which sudo &> /dev/null && sudo_cmd='sudo'

function bakup_once(){
  raw=$1
  suffix=capt.bak
  target=$raw.$suffix
  [ -e "$target" ] || {
    $sudo_cmd mv $raw $target
  } 
}

bakup_once /etc/apt/sources.list
#bakup_once /etc/apt/sources.list.d

# docker下没有lsb_release
which lsb_release &>/dev/null || {
  $sudo_cmd apt-get -y update
  $sudo_cmd apt-get -y install lsb-release
  echo ==installing lsb_release
}

if which lsb_release &>/dev/null; then
  version=$(lsb_release -rs)
else
  version=${UBUNTU_VERSION:-1604}
fi
# 移除可能的dot, 16.04 --> 1604
tag=${version//.}
if [ $# -gt 0 ]; then
  tag=$tag-$1
fi

lfile=$(dirname $0)/share/${tag}-source
if [ -e $lfile ]; then
  $sudo_cmd cp -f $lfile /etc/apt/sources.list
else
  url=${SOURCE_URL:-https://github.com/cao7113/capt/raw/master/share/${tag}-source}
  echo == get source from: $url
  #$sudo_cmd wget -O /etc/apt/sources.list $url
  $sudo_cmd curl -sSL $url > /etc/apt/sources.list
fi

$sudo_cmd apt-get -y update
$sudo_cmd apt-get -y install vim

echo ==finished change sources
