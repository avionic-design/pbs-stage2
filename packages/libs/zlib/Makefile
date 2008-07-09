PACKAGE = zlib
VERSION = 1.2.3

LOCATION = http://www.zlib.net
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

env += \
	CC='$(CC)' \
	CFLAGS='$(CFLAGS)'

conf-args = \
	--prefix=$(prefix) \
	--shared

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) $(STRIP) $(ROOTFS)/usr/lib/libz.so.*

package-clean:
	@:

