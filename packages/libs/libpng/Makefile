PACKAGE = libpng
VERSION = 1.2.33

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

conf-args = \
	--prefix=$(prefix) \
	--host=$(TARGET)

conf-vars = \
	CC='$(CC) --sysroot $(ROOTFS)' \
	CFLAGS='$(CFLAGS)'

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

_install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

prunefiles = \
	$(prefix)/lib/libpng.la \
	$(prefix)/lib/libpng12.la

stripfiles = \
	$(prefix)/lib/libpng.so.3.33.0 \
	$(prefix)/lib/libpng12.so.0.33.0

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

