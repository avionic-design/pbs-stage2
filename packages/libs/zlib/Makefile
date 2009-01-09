PACKAGE = zlib
VERSION = 1.2.3

LOCATION = http://www.zlib.net
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

env += \
	CC='$(CC) --sysroot $(ROOTFS)' \
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

package-do-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install

prunefiles =
stripfiles = \
	$(prefix)/lib/libz.so.1.2.3

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

