PACKAGE = gcc
VERSION = 4.1.2

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)/$(PACKAGE_FULLNAME)
TARBALLS = $(PACKAGE)-core-$(VERSION).tar.bz2

CROSS_COMPILE = $(PLATFORM)/usr/bin/$(HOST)-
CC = $(CROSS_COMPILE)gcc
CXX = $(CROSS_COMPILE)g++
LD = $(CROSS_COMPILE)ld
RANLIB = $(CROSS_COMPILE)ranlib
AS = $(CROSS_COMPILE)as
AR = $(CROSS_COMPILE)ar
CPP = $(CROSS_COMPILE)cpp
STRIP = $(CROSS_COMPILE)strip

STAGE_EXPORTS = LD RANLIB AS AR CPP STRIP

env = PATH=/usr/bin:/bin:$(PLATFORM)/usr/bin \
	$(foreach var, $(STAGE_EXPORTS), $(var)='$($(var))')

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
	cd $(pkgtree) && $(MAKE) all-gcc

package-install:
	cd $(pkgtree) && $(MAKE) DESTDIR=$(PLATFORM) install-gcc

