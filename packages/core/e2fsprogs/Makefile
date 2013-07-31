PACKAGE = e2fsprogs
VERSION = 1.42.8
LICENSE = GPL

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--enable-symlink-install \
	--enable-relative-symlinks \
	--enable-symlink-build \
	--disable-fsck \
	--disable-libuuid \
	--disable-libblkid \
	--disable-uuidd

ifneq ($(LIBC),gnu)
  conf-args += \
	--disable-tls
endif

prunefiles = \
	$(prefix)/sbin/fsck.ext4dev \
	$(prefix)/sbin/mkfs.ext4dev

stripfiles = \
	$(prefix)/bin/chattr \
	$(prefix)/bin/lsattr \
	$(prefix)/lib/e2initrd_helper \
	$(prefix)/sbin/badblocks \
	$(prefix)/sbin/debugfs \
	$(prefix)/sbin/dumpe2fs \
	$(prefix)/sbin/e2freefrag \
	$(prefix)/sbin/e2fsck \
	$(prefix)/sbin/e2image \
	$(prefix)/sbin/e2label \
	$(prefix)/sbin/e2undo \
	$(prefix)/sbin/e4defrag \
	$(prefix)/sbin/filefrag \
	$(prefix)/sbin/findfs \
	$(prefix)/sbin/fsck \
	$(prefix)/sbin/fsck.ext2 \
	$(prefix)/sbin/fsck.ext3 \
	$(prefix)/sbin/fsck.ext4 \
	$(prefix)/sbin/logsave \
	$(prefix)/sbin/mke2fs \
	$(prefix)/sbin/mkfs.ext2 \
	$(prefix)/sbin/mkfs.ext3 \
	$(prefix)/sbin/mkfs.ext4 \
	$(prefix)/sbin/mklost+found \
	$(prefix)/sbin/resize2fs \
	$(prefix)/sbin/tune2fs
