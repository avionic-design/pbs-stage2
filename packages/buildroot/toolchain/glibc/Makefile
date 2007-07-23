PACKAGE = glibc
VERSION = 2.6

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

include packages/toolchain/common.mk

env += \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes \
	libc_cv_$(ARCH)_tls=yes

package-extract:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports

conf-args = \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--enable-addons=ports \
	--with-headers=$(PLATFORM)/usr/include

ifeq ($(FLOAT),soft)
	conf-args += --without-fp
endif

package-configure:
	mkdir -p $(pkgtree)/obj-$(HOST) && cd $(pkgtree)/obj-$(HOST) && \
		$(env) ../configure --host=$(HOST) --build=$(BUILD) \
			$(conf-args)

build-args = \
	MAKEFLAGS=

package-build:
	cd $(pkgtree)/obj-$(HOST) && $(env) $(MAKE) $(build-args) all

install-args = \
	install_root=$(PLATFORM)

package-install:
	cd $(pkgtree)/obj-$(HOST) && $(env) $(MAKE) $(install-args) install

