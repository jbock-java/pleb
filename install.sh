#!/bin/bash
[[ $EUID -eq 0 ]] && {
  echo "run as normal user"
  exit 1
}

OG_USER=$(whoami)

[[ -d system ]] || {
  sudo debootstrap --include=efitools,kbd bookworm system
  sudo chown -R ${OG_USER}: system
}

rm -f system/sbin/init
cp init system/init
chmod +x system/init
