#!/bin/bash
[[ $EUID > 0 ]] && {
  echo "run as root"
  exit 1
}

[[ -d system ]] || {
  debootstrap --include=efitools bookworm system
}

rm -f system/sbin/init
cat << EOF >> system/init
#!/bin/bash
mount -t devtmpfs none /dev
mkdir -p /proc /sys
mount -t proc none /proc
mount -t sysfs none /sys
mount -n -t tmpfs none /dev

echo "Hello World!" > /dev/kmsg
sleep inf
poweroff -f
EOF
chmod +x system/init
