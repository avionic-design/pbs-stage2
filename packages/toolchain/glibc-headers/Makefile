PACKAGE = glibc
VERSION = 2.6

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

include packages/toolchain/common.mk

env += libc_ac_cv_tls=yes

package-extract:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports

package-configure:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports
	cd $(pkgtree) && mkdir -p hdr-$(HOST) && cd hdr-$(HOST) && \
		$(env) ../configure --host=$(HOST) --prefix=/usr --without-cvs \
			--disable-sanity-checks --enable-hacker-mode \
			--enable-addons=ports --enable-tls \
			--with-sysroot=$(PLATFORM) \
			--with-headers=$(PLATFORM)/usr/include

package-build:

package-install:
	cd $(pkgtree)/hdr-$(HOST) && $(env) $(MAKE) cross-compiling=yes \
		install_root=$(PLATFORM) CFLAGS=-DBOOTSTRAP_GCC \
		install-headers
	mkdir -p $(PLATFORM)/usr/include/gnu
	touch $(PLATFORM)/usr/include/gnu/stubs.h
	cd $(pkgtree) && \
		cp hdr-$(HOST)/include/features.h $(PLATFORM)/usr/include/features.h && \
		cp hdr-$(HOST)/bits/*.h $(PLATFORM)/usr/include/bits

