#!/bin/sh

board=add-medinet
mp=/media
dev=/dev/sdc

if [ "x`id -u`" != "x0" ]; then
	echo "must be super user"
	exit 1
fi

if [ "x$1" != "x" ]; then
	dev="$1"
fi

if [ "x$2" != "x" ]; then
	mp="$2"
fi

if [ "x$3" != "x" ]; then
	board="$3"
fi

umount $mp

set -e
set -x

#mount $dev $mp
#cat /dev/null > $mp/u-boot.img
#rm $mp/u-boot.img
#sleep 5
#umount $mp
mount $dev $mp
cp platform/$board/initrd/u-boot.img $mp
cp platform/$board/minimal/rootfs.img $mp
umount $mp

