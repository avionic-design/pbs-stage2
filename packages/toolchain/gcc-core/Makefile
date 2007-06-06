PACKAGE = gcc
VERSION = 4.2.0

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)/$(PACKAGE_FULLNAME)
TARBALLS = $(PACKAGE)-core-$(VERSION).tar.bz2

include packages/toolchain/common.mk

package-configure:
	cd $(pkgtree) && $(env) ./configure --target=$(HOST) --prefix=/usr \
		--with-local-prefix=$(PLATFORM) --with-sysroot=$(PLATFORM) \
		--with-build-sysroot=$(PLATFORM) --without-headers \
		--with-float=soft --enable-threads=no --disable-nls \
		--enable-symvers=gnu --disable-shared \
		--enable-languages=c

#		--disable-multilib --with-newlib --enable-threads=no \
#		--disable-nls --enable-symvers=gnu --disable-shared \
#		--with-float=soft --enable-languages=c

package-build:
	cd $(pkgtree) && $(env) $(MAKE) all-gcc

package-install:
	cd $(pkgtree) && $(env) $(MAKE) DESTDIR=$(PLATFORM) install-gcc

