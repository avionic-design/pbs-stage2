#!/bin/sh

board=adx-medcom
mp=/media/sd-card
dev=/dev/sdc
variant=minimal

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

if [ "x$4" != "x" ]; then
	variant="$4"
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
mkdir $mp/boot
cp platform/$board/initrd/u-boot.img $mp/boot
cp platform/$board/$variant/rootfs.img $mp
umount $mp

