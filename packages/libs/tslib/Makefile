PACKAGE = tslib
VERSION = 1.0.0-svn70

LOCATION = http://download.berlios.de/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

##############################################################################

include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

CPPFLAGS += \
	-DUSE_INPUT_API=1

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-vars = \
	CFLAGS='$(CFLAGS)' \
	CPPFLAGS='$(CPPFLAGS)' \
	ac_cv_func_malloc_0_nonnull=yes

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

package-do-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

plugin = $(prefix)/lib/ts

prunefiles = \
	$(prefix)/lib/libts.la \
	$(plugin)/*.la

stripfiles = \
	$(prefix)/bin/ts_test \
	$(prefix)/bin/ts_print_raw \
	$(prefix)/bin/ts_calibrate \
	$(prefix)/bin/ts_harvest \
	$(prefix)/bin/ts_print \
	$(prefix)/lib/libts-1.0.so.0.0.0 \
	$(plugin)/*.so

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

