PACKAGE = util-linux-ng
VERSION = 2.16

LOCATION = http://www.kernel.org/pub/linux/utils/util-linux-ng/v2.16
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--libdir=/lib

conf-args += \
	--with-cc='$(CC)' \
	--with-ccopts='$(CFLAGS)' \
	--with-linker='$(LD)' \
	--with-ldopts='$(LDFLAGS)' \
	--disable-libblkid \
	--enable-libuuid

conf-vars += \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

prunefiles = \
	$(prefix)/lib/libuuid.la

stripfiles = \
	/lib/libuuid.so.1.3.0
