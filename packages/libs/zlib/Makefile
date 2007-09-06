PACKAGE = zlib
VERSION = 1.2.3

LOCATION = http://www.zlib.net
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

env = env -i $(call set-args, CC CFLAGS LDFLAGS AR RANLIB) prefix=/usr

conf-args = \
	--shared

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) $(STRIP) $(ROOTFS)/usr/lib/libz.so.*

package-clean:
	@:

