PACKAGE = mtd-utils
VERSION = 1.4.6
LICENSE = GPL

LOCATION = ftp://ftp.infradead.org/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CROSS=$(CROSS_COMPILE) \
	CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	WITHOUT_XATTR=1

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR) \
	$(build-args)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

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

include packages/cleanup.mk
include packages/binary.mk
