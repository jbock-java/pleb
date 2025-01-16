#!/bin/bash
[[ $EUID > 0 ]] && {
  echo "run as root"
  exit 1
}

[[ -d system ]] && {
  rm -rf system
}
