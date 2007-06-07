PACKAGE = binutils
VERSION = 2.17

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/toolchain/common.mk

package-configure:
	cd $(pkgtree) && $(env) ./configure --target=$(HOST) --prefix=/usr \
		--disable-nls --enable-tls --with-sysroot=$(PLATFORM) \
		--mandir=/usr/share/man

package-build:
	cd $(pkgtree) && $(env) $(MAKE)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) DESTDIR=$(PLATFORM) install

