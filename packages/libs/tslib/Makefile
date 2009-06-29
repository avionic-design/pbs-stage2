PACKAGE = tslib
VERSION = 1.0.0-svn70

LOCATION = http://download.berlios.de/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

##############################################################################

include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

$(pkgtree)/.setup:
	$(call cmd,stamp)

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

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args =
$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(ROOTFS)

$(pkgtree)/.do-install: $(pkgtree)/.binary
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

plugin = $(prefix)/lib/ts

prunefiles = \
	/etc/ts.conf \
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

$(pkgtree)/.install: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	$(call cmd,stamp)
