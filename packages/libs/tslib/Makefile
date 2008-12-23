PACKAGE = tslib
VERSION = 1.0

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
	cd $(pkgtree) && ./autogen.sh
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh
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

plugin = $(prefix)/lib/ts

prunefiles = \
	$(prefix)/lib/libts.la \
	$(plugin)/arctic2.la \
	$(plugin)/collie.la \
	$(plugin)/corgi.la \
	$(plugin)/dejitter.la \
	$(plugin)/h3600.la \
	$(plugin)/input.la \
	$(plugin)/linear_h2200.la \
	$(plugin)/linear.la \
	$(plugin)/mk712.la \
	$(plugin)/pthres.la \
	$(plugin)/ucb1x00.la \
	$(plugin)/variance.la

stripfiles = \
	$(plugin)/variance.so \
	$(plugin)/pthres.so \
	$(plugin)/linear_h2200.so \
	$(plugin)/mk712.so \
	$(plugin)/linear.so \
	$(plugin)/corgi.so \
	$(plugin)/input.so \
	$(plugin)/arctic2.so \
	$(plugin)/dejitter.so \
	$(plugin)/h3600.so \
	$(plugin)/ucb1x00.so \
	$(plugin)/collie.so \
	$(prefix)/lib/libts-0.0.so.0.1.1 \
	$(prefix)/bin/ts_test \
	$(prefix)/bin/ts_print_raw \
	$(prefix)/bin/ts_calibrate \
	$(prefix)/bin/ts_harvest \
	$(prefix)/bin/ts_print

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

