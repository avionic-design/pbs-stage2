PACKAGE = glibc
VERSION = 2.6

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

include packages/toolchain/common.mk

env += \
	BUILD_CC=gcc
#	CC=$(CORE_PREFIX)/bin/$(HOST)-gcc \
#	AR=$(PLATFORM)/usr/bin/$(HOST)-ar \
#	RANLIB=$(PLATFORM)/usr/bin/$(HOST)-ranlib

package-configure:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports
	cd $(pkgtree) && mkdir -p obj-$(HOST) && cd obj-$(HOST)
	# setup the autoconf cache
	cd $(pkgtree)/obj-$(HOST) && \
		echo 'libc_cv_forced_unwind=yes' > config.cache && \
		echo 'libc_cv_c_cleanup=yes' >> config.cache
	# setup configuration parameters
	cd $(pkgtree)/obj-$(HOST) && \
		echo 'install_root=$(PLATFORM)' > configparms
	# configure the package
	cd $(pkgtree)/obj-$(HOST) && \
		$(env) ../configure --host=$(HOST) --build=$(BUILD) \
			--prefix=/usr --libexecdir=/usr/lib/glibc \
			--disable-profile --enable-add-ons --with-tls \
			--enable-kernel=2.6.0 --with-__thread \
			--with-sysroot=$(PLATFORM) \
			--with-headers=$(PLATFORM)/usr/include \
			--cache-file=config.cache
#			--with-binutils=$(PLATFORM)/usr/bin \

package-build:
	cd $(pkgtree)/obj-$(HOST) && $(env) $(MAKE) all

package-install:
	cd $(pkgtree)/obj-$(HOST) && \
		$(env) $(MAKE) install

