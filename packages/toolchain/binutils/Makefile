PACKAGE = binutils
VERSION = 2.17

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/toolchain/common.mk

conf_opts = \
	--with-sysroot=$(PLATFORM) \
	--disable-nls \
	--enable-tls \
	--enable-shared
#	--disable-multilib

package-configure:
	cd $(pkgtree) && $(env) ./configure --target=$(HOST) --prefix=/usr \
		--mandir=/usr/share/man $(conf_opts)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) configure-host
	cd $(pkgtree) && $(env) $(MAKE)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) DESTDIR=$(PLATFORM) install
	cd $(pkgtree) && cp include/libiberty.h $(PLATFORM)/usr/include

