PACKAGE = util-linux
VERSION = 2.19

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://www.kernel.org/pub/linux/utils/$(PACKAGE)/v$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

$(pkgtree)/.autoreconfigure:
	cd $(pkgbuildtree) && \
		$(env) autoreconf --force --install
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.autoreconfigure

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-libmount \
	--disable-rpath

ifneq ($(CONFIG_PACKAGE_CORE_UTIL_LINUX_NCURSES),y)
  conf-args += --without-ncurses
endif

ifneq ($(CONFIG_LIBC),gnu)
  conf-args += \
	--disable-nls
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	/bin/dmesg \
	/bin/findmnt \
	/bin/lsblk \
	/bin/more \
	/bin/mount \
	/bin/umount \
	/lib/*.so.* \
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
	/sbin/fsfreeze \
	/sbin/fstrim \
	/sbin/hwclock \
	/sbin/losetup \
	/sbin/mkfs \
	/sbin/mkfs.bfs \
	/sbin/mkfs.cramfs \
	/sbin/mkfs.minix \
	/sbin/mkswap \
	/sbin/pivot_root \
	/sbin/sfdisk \
	/sbin/swaplabel \
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
	$(prefix)/sbin/addpart \
	$(prefix)/sbin/delpart \
	$(prefix)/sbin/fdformat \
	$(prefix)/sbin/ldattach \
	$(prefix)/sbin/readprofile \
	$(prefix)/sbin/rtcwake \
	$(prefix)/sbin/tunelp \
	$(prefix)/sbin/uuidd
