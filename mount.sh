#!/bin/bash
[[ $EUID > 0 ]] && {
  echo "run as root"
  exit 1
}

exec chroot system /usr/bin/bash
