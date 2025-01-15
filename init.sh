#!/bin/bash
[[ $EUID > 0 ]] && {
  echo "run as root"
  exit 1
}

debootstrap --include=efitools bookworm system

cd system
rm sbin/init
cat << EOF >> init
#!/bin/bash
mkdir -p /proc /sys
mount -t proc none /proc
mount -t sysfs none /sys
mount -n -t tmpfs none /dev
mknod /dev/console c 5 1

echo Hello World!
sleep 5
poweroff -f
EOF
chmod +x init
