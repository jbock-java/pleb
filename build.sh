#!/bin/bash
[[ $EUID > 0 ]] && {
  echo "run as root"
  exit 1
}

[[ -d system ]] || {
  echo "run ./init.sh first"
  exit 1
}

cd system
find . | cpio -o --format=newc | gzip -9 > ../ramdisk.cpio.gz
