#!/usr/bin/env bash
set -e

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

$sudo_cmd sed -i 's/archive.ubuntu/cn.archive.ubuntu/' /etc/apt/sources.list

$sudo_cmd apt-get -y update
$sudo_cmd apt-get -y install vim

echo ==finished change sources
