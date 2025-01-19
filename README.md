### Links

[Akhilesh Moghe](https://akhileshmoghe.github.io/_post/linux/debian_minimal_rootfs)

[James Gibbard](https://www.gibbard.me/linux_initramfs_initrd/)

[How to populate dev](https://unix.stackexchange.com/questions/52713/how-to-populate-dev-directory-when-building-my-own-initrd)

[systemd-nspawn](https://wiki.archlinux.org/title/Systemd-nspawn)

[Using chroot](https://wiki.archlinux.org/title/Chroot)

### Building

```
./install.sh
make build
```

### Fedora

```
mkdir rootfs #on btrfs: btrfs subvolume create rootfs
cd rootfs
mount -tproc /proc proc/
mount -obind -tsysfs /sys sys/
mount -obind /dev dev/
mount -obind /run run/
cd ..
dnf --use-host-config --releasever=41 --best --setopt=install_weak_deps=False --repo=fedora --repo=updates --installroot=/root/workspace/ramfs/rootfs install dhcp-client dnf fedora-release glibc glibc-langpack-en iputils less ncurses passwd systemd systemd-networkd systemd-resolved util-linux vim-default-editor
umount rootfs/proc
umount rootfs/sys
umount rootfs/dev
umount rootfs/run
#edit rootfs/etc/shadow
systemd-nspawn -b -D rootfs
```

### root shell in initrd from installation media

```
./inspect
find /usr/lib/systemd/system/ -name "*dracut*" -exec rm -rf '{}' ';'

./run
```
