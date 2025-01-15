#!/bin/bash
[[ -f ramdisk.cpio ]] || {
  echo "run ./build.sh first"
  exit 1
}

qemu-system-x86_64 \
    -kernel /boot/vmlinuz-$(uname -r) \
    -initrd ramdisk.cpio \
    -append 'console=ttyS0 quiet' \
    -m 1000 -display none -serial stdio
