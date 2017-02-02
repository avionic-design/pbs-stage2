PACKAGE = mtd-utils
VERSION = 2.0.0
LICENSE = GPL

LOCATION = ftp://ftp.infradead.org/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += --without-xattr

ifeq ($(CONFIG_PACKAGE_UTIL_MTD_UTILS_WITHOUT_LZO),y)
conf-args += --without-lzo
endif
ifeq ($(CONFIG_PACKAGE_UTIL_MTD_UTILS_WITHOUT_UBI),y)
conf-args += --without-ubifs
endif

stripfiles = \
	$(prefix)/sbin/docfdisk \
	$(prefix)/sbin/doc_loadbios \
	$(prefix)/sbin/flashcp \
	$(prefix)/sbin/flash_erase \
	$(prefix)/sbin/flash_info \
	$(prefix)/sbin/flash_lock \
	$(prefix)/sbin/flash_otp_dump \
	$(prefix)/sbin/flash_otp_info \
	$(prefix)/sbin/flash_unlock \
	$(prefix)/sbin/ftl_check \
	$(prefix)/sbin/ftl_format \
	$(prefix)/sbin/jffs2dump \
	$(prefix)/sbin/jffs2reader \
	$(prefix)/sbin/mkfs.jffs2 \
	$(prefix)/sbin/mkfs.ubifs \
	$(prefix)/sbin/mtd_debug \
	$(prefix)/sbin/mtdinfo \
	$(prefix)/sbin/nanddump \
	$(prefix)/sbin/nandtest \
	$(prefix)/sbin/nandwrite \
	$(prefix)/sbin/nftldump \
	$(prefix)/sbin/nftl_format \
	$(prefix)/sbin/recv_image \
	$(prefix)/sbin/rfddump \
	$(prefix)/sbin/rfdformat \
	$(prefix)/sbin/serve_image \
	$(prefix)/sbin/sumtool \
	$(prefix)/sbin/ubiattach \
	$(prefix)/sbin/ubicrc32 \
	$(prefix)/sbin/ubidetach \
	$(prefix)/sbin/ubiformat \
	$(prefix)/sbin/ubimkvol \
	$(prefix)/sbin/ubinfo \
	$(prefix)/sbin/ubinize \
	$(prefix)/sbin/ubirename \
	$(prefix)/sbin/ubirmvol \
	$(prefix)/sbin/ubirsvol \
	$(prefix)/sbin/ubiupdatevol
