PACKAGE = util-linux-ng
VERSION = 2.17.2

LOCATION = http://www.kernel.org/pub/linux/utils/$(PACKAGE)/v2.17
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

ifneq ($(CONFIG_PACKAGE_CORE_UTIL_LINUX_NCURSES),y)
  conf-args += --without-ncurses
endif

ifneq ($(CONFIG_LIBC),gnu)
  conf-args += --disable-tls
endif

prunefiles = \
	$(prefix)/lib/libblkid.la \
	$(prefix)/lib/libuuid.la

stripfiles = \
	/bin/dmesg \
	/bin/more \
	/bin/mount \
	/bin/umount \
	/lib/libblkid.so.1.1.0 \
	/lib/libuuid.so.1.3.0 \
	/sbin/agetty \
	/sbin/blkid \
	/sbin/blockdev \
	/sbin/cfdisk \
	/sbin/ctrlaltdel \
	/sbin/fdisk \
	/sbin/findfs \
	/sbin/fsck \
	/sbin/fsck.cramfs \
	/sbin/fsck.minix \
	/sbin/hwclock \
	/sbin/losetup \
	/sbin/mkfs \
	/sbin/mkfs.bfs \
	/sbin/mkfs.cramfs \
	/sbin/mkfs.minix \
	/sbin/mkswap \
	/sbin/pivot_root \
	/sbin/sfdisk \
	/sbin/swapon \
	/sbin/switch_root \
	/sbin/wipefs \
	$(prefix)/bin/cal \
	$(prefix)/bin/chrt \
	$(prefix)/bin/col \
	$(prefix)/bin/colcrt \
	$(prefix)/bin/colrm \
	$(prefix)/bin/column \
	$(prefix)/bin/cytune \
	$(prefix)/bin/ddate \
	$(prefix)/bin/fallocate \
	$(prefix)/bin/flock \
	$(prefix)/bin/getopt \
	$(prefix)/bin/hexdump \
	$(prefix)/bin/ionice \
	$(prefix)/bin/ipcmk \
	$(prefix)/bin/ipcrm \
	$(prefix)/bin/ipcs \
	$(prefix)/bin/isosize \
	$(prefix)/bin/line \
	$(prefix)/bin/logger \
	$(prefix)/bin/look \
	$(prefix)/bin/lscpu \
	$(prefix)/bin/mcookie \
	$(prefix)/bin/namei \
	$(prefix)/bin/pg \
	$(prefix)/bin/rename \
	$(prefix)/bin/renice \
	$(prefix)/bin/rev \
	$(prefix)/bin/script \
	$(prefix)/bin/scriptreplay \
	$(prefix)/bin/setarch \
	$(prefix)/bin/setsid \
	$(prefix)/bin/setterm \
	$(prefix)/bin/tailf \
	$(prefix)/bin/taskset \
	$(prefix)/bin/ul \
	$(prefix)/bin/unshare \
	$(prefix)/bin/uuidgen \
	$(prefix)/bin/wall \
	$(prefix)/bin/whereis \
	$(prefix)/sbin/fdformat \
	$(prefix)/sbin/ldattach \
	$(prefix)/sbin/readprofile \
	$(prefix)/sbin/rtcwake \
	$(prefix)/sbin/tunelp \
	$(prefix)/sbin/uuidd
