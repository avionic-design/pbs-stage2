PACKAGE = gcc
VERSION = 4.2.0

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)/$(PACKAGE_FULLNAME)
TARBALLS = \
	$(PACKAGE)-core-$(VERSION).tar.bz2 \
	$(PACKAGE)-g++-$(VERSION).tar.bz2

include packages/toolchain/common.mk

configure:
	cd $(pkgtree) && $(env) ./configure --target=$(HOST) --prefix=/usr \
		--with-local-prefix=$(PLATFORM) --with-sysroot=$(PLATFORM) \
		--with-build-sysroot=$(PLATFORM) --with-float=soft \
		--enable-symvers=gnu --enable-languages=c,c++

build:
	cd $(pkgtree) && $(env) $(MAKE)

install:
	cd $(pkgtree) && $(env) $(MAKE) DESTDIR=$(PLATFORM) install

