PACKAGE = glibc
VERSION = 2.6

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

include packages/toolchain/common.mk

BUILD = $(shell uname -m)
env += \
	BUILD_CC=gcc \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes

package-configure:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports
	cd $(pkgtree) && mkdir -p obj-$(HOST) && cd obj-$(HOST) && \
		$(env) ../configure --host=$(HOST) --build=$(BUILD) --prefix=/usr --without-cvs \
			--disable-profile --disable-debug --without-gd \
			--enable-addons=ports --enable-tls \
			--with-sysroot=$(PLATFORM) \
			--with-headers=$(PLATFORM)/usr/include

package-build:
	cd $(pkgtree)/obj-$(HOST) && $(env) $(MAKE) all

package-install:
	cd $(pkgtree)/obj-$(HOST) && \
		$(env) $(MAKE) install_root=$(PLATFORM) install

