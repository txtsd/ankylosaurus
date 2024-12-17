#!/bin/sh

# From: https://git.snrd.eu/SunRed/arch-packages

[ -z "$CHROOT" ] && echo "CHROOT env var is unset." && exit 1

sudo -v || exit 1

[ ! -d "$CHROOT/root" ] && sudo mkarchroot -M "$(dirname "$0")"/makepkg.conf "$CHROOT/root" base-devel

arch-nspawn "$CHROOT/root" pacman -Syu
mkdir -p -m 0755 "$CHROOT/$USER"

mountpoint -q "$CHROOT/$USER"
test $? -ne 0 && sudo mount -t tmpfs -o defaults,nodev,mode=0755,uid=$(id -u),gid=$(id -g) tmpfs "$CHROOT/$USER"

exit 0
