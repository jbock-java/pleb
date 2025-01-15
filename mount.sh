#!/bin/bash
[[ $EUID > 0 ]] && {
  echo "run as root"
  exit 1
}

for S in proc sys dev run; do
  mount --bind /$S system/$S
done
exec chroot system /usr/bin/bash
