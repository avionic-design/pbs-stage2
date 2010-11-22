PACKAGE = e2fsprogs
VERSION = 1.41.12

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

stripfiles = \
	$(prefix)/bin/chattr \
	$(prefix)/bin/lsattr \
	$(prefix)/bin/uuidgen \
	$(prefix)/lib/e2initrd_helper \
	$(prefix)/sbin/badblocks \
	$(prefix)/sbin/blkid \
	$(prefix)/sbin/debugfs \
	$(prefix)/sbin/dumpe2fs \
	$(prefix)/sbin/e2freefrag \
	$(prefix)/sbin/e2fsck \
	$(prefix)/sbin/e2image \
	$(prefix)/sbin/e2label \
	$(prefix)/sbin/e2undo \
	$(prefix)/sbin/filefrag \
	$(prefix)/sbin/findfs \
	$(prefix)/sbin/fsck \
	$(prefix)/sbin/fsck.ext2 \
	$(prefix)/sbin/fsck.ext3 \
	$(prefix)/sbin/fsck.ext4 \
	$(prefix)/sbin/fsck.ext4dev \
	$(prefix)/sbin/logsave \
	$(prefix)/sbin/mke2fs \
	$(prefix)/sbin/mkfs.ext2 \
	$(prefix)/sbin/mkfs.ext3 \
	$(prefix)/sbin/mkfs.ext4 \
	$(prefix)/sbin/mkfs.ext4dev \
	$(prefix)/sbin/mklost+found \
	$(prefix)/sbin/resize2fs \
	$(prefix)/sbin/tune2fs \
	$(prefix)/sbin/uuidd
