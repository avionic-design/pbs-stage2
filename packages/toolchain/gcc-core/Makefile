PACKAGE = gcc
VERSION = 4.2.0

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)/$(PACKAGE_FULLNAME)
TARBALLS = $(PACKAGE)-core-$(VERSION).tar.bz2

include packages/toolchain/common.mk

conf_opts =
ifeq ($(LIBC), glibc)
	conf_opts += --enable-__cxa_atexit
else
	conf_opts += --disable-multilib
endif

package-configure:
	mkdir -p $(CORE_PREFIX)/$(HOST)/include
	cp -r $(PLATFORM)/usr/include/* $(CORE_PREFIX)/$(HOST)/include
	mkdir -p $(pkgtree)/bootstrap-$(HOST) && cd $(pkgtree)/bootstrap-$(HOST) && \
		$(env) ../configure --target=$(HOST) --prefix=$(CORE_PREFIX) \
			--with-local-prefix=$(PLATFORM) --with-sysroot=$(PLATFORM) \
			--with-newlib --with-softfloat --disable-nls \
			--enable-threads=no --enable-symvers=gnu --disable-static \
			--enable-languages=c $(conf_opts)

# original command
#	cd $(pkgtree) && $(env) ./configure --target=$(HOST) --prefix=/usr \
#		--with-local-prefix=$(PLATFORM) --with-sysroot=$(PLATFORM) \
#		--with-build-sysroot=$(PLATFORM) --without-headers \
#		--with-float=soft --enable-threads=no --disable-nls \
#		--enable-symvers=gnu --disable-shared \
#		--enable-languages=c

# not working
#		--disable-multilib --with-newlib --enable-threads=no \
#		--disable-nls --enable-symvers=gnu --disable-shared \
#		--with-float=soft --enable-languages=c

package-build:
	cd $(pkgtree)/bootstrap-$(HOST) && $(env) $(MAKE) all-gcc

package-install:
	cd $(pkgtree)/bootstrap-$(HOST) && $(env) $(MAKE) install-gcc

