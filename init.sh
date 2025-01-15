#!/bin/bash
[[ $EUID > 0 ]] && {
  echo "run as root"
  exit 1
}

[[ -d system ]] || {
  debootstrap --include=efitools bookworm system
}

rm -f system/sbin/init
cp init system/init
chmod +x system/init
