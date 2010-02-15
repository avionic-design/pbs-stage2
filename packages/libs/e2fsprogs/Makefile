PACKAGE = e2fsprogs-libs
VERSION = 1.41.7

LOCATION = http://prdownloads.sourceforge.net/e2fsprogs
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-cc='$(CC)' \
	--with-ccopts='$(CFLAGS)' \
	--with-linker='$(LD)' \
	--with-ldopts='$(LDFLAGS)' \
	--enable-elf-shlibs \
	--disable-libblkid \
	--disable-rpath \
	--disable-tls

stripfiles = \
	$(prefix)/lib/libblkid.so.1.0 \
	$(prefix)/lib/libcom_err.so.2.1 \
	$(prefix)/lib/libss.so.2.0 \
	$(prefix)/lib/libuuid.so.1.2
