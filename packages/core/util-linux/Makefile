PACKAGE = util-linux
VERSION = 2.27.1
LICENSE = GPL/BSD

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://www.kernel.org/pub/linux/utils/$(PACKAGE)/v$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

conf-args += \
	--disable-rpath \
	--without-python

ifneq ($(CONFIG_PACKAGE_CORE_UTIL_LINUX_NCURSES),y)
  conf-args += --without-ncurses
endif

ifneq ($(CONFIG_PACKAGE_CORE_UTIL_LINUX_PAM),y)
  conf-args += \
	--disable-login \
	--disable-su
endif

ifneq ($(CONFIG_LIBC),gnu)
  conf-args += \
	--disable-nls
endif

ifeq ($(CONFIG_LIBC),gnu)
conf-vars += scanf_cv_alloc_modifier=ms
else
  ifeq ($(CONFIG_LIBC),uclibc)
    conf-vars += scanf_cv_alloc_modifier=ms
  else
    conf-vars += scanf_cv_alloc_modifier=no
  endif
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	/bin/dmesg \
	/bin/findmnt \
	/bin/kill \
	/bin/login \
	/bin/lsblk \
	/bin/more \
	/bin/mount \
	/bin/mountpoint \
	/bin/su \
	/bin/umount \
	/bin/wdctl \
	/sbin/agetty \
	/sbin/blkid \
	/sbin/blockdev \
	/sbin/cfdisk \
	/sbin/chcpu \
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
	/sbin/raw \
	/sbin/sfdisk \
	/sbin/sulogin \
	/sbin/swaplabel \
	/sbin/swapoff \
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
	$(prefix)/bin/eject \
	$(prefix)/bin/fallocate \
	$(prefix)/bin/flock \
	$(prefix)/bin/getopt \
	$(prefix)/bin/hexdump \
	$(prefix)/bin/ionice \
	$(prefix)/bin/ipcmk \
	$(prefix)/bin/ipcrm \
	$(prefix)/bin/ipcs \
	$(prefix)/bin/isosize \
	$(prefix)/bin/logger \
	$(prefix)/bin/look \
	$(prefix)/bin/lscpu \
	$(prefix)/bin/lslocks \
	$(prefix)/bin/mcookie \
	$(prefix)/bin/namei \
	$(prefix)/bin/pg \
	$(prefix)/bin/prlimit \
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
	$(prefix)/bin/utmpdump \
	$(prefix)/bin/uuidgen \
	$(prefix)/bin/wall \
	$(prefix)/bin/whereis \
	$(prefix)/lib/*.so.* \
	$(prefix)/sbin/addpart \
	$(prefix)/sbin/delpart \
	$(prefix)/sbin/fdformat \
	$(prefix)/sbin/ldattach \
	$(prefix)/sbin/partx \
	$(prefix)/sbin/readprofile \
	$(prefix)/sbin/resizepart \
	$(prefix)/sbin/rtcwake \
	$(prefix)/sbin/tunelp \
	$(prefix)/sbin/uuidd
