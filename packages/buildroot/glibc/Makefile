PACKAGE = glibc
VERSION = 2.6

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

include packages/buildroot/common.mk

conf-args += \
	--with-headers=$(ROOTFS)/tools/include \
	--enable-addons=ports

package-configure:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports
	mkdir -p $(pkgtree)/obj-$(HOST) && cd $(pkgtree)/obj-$(HOST) && \
		$(env) ../configure $(conf-args) $(conf-vars)

build-vars += \
	MAKEFLAGS=

package-build:
	cd $(pkgtree)/obj-$(HOST) && $(env) $(MAKE) $(build-args) $(build-vars)

install-args := \
	install_root=$(ROOTFS)

package-install:
	cd $(pkgtree)/obj-$(HOST) && $(env) $(MAKE) $(install-args) $(install-vars) install

