PACKAGE = gcc
VERSION = 4.2.0

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)/$(PACKAGE_FULLNAME)
TARBALLS = $(PACKAGE)-core-$(VERSION).tar.bz2

include packages/toolchain/common.mk

conf_opts = \
	--disable-threads \
	--disable-nls \
	--disable-shared \
	--without-headers \
	--with-newlib \
	--enable-languages=c

ifeq ($(LIBC), glibc)
	conf_opts += --enable-__cxa_atexit
endif

package-configure:
	mkdir -p $(pkgtree)/core-$(HOST) && cd $(pkgtree)/core-$(HOST) && \
		$(env) ../configure --target=$(HOST) --prefix=$(CORE_PREFIX) \
			$(conf_opts)

package-build:
	cd $(pkgtree)/core-$(HOST) && $(env) $(MAKE) all-gcc

package-install:
	cd $(pkgtree)/core-$(HOST) && $(env) $(MAKE) install-gcc

