PACKAGE = pixman
VERSION = 0.15.14

LOCATION = http://xorg.freedesktop.org/releases/individual/lib
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

##############################################################################

include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

ifeq ($(CONFIG_ARCH),arm)
conf-args += \
	--disable-arm-neon \
	--disable-arm-simd
endif

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)'

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

install-args = \
	DESTDIR=$(ROOTFS)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

prunefiles = \
	$(prefix)/lib/libpixman-1.la

stripfiles = \
	$(prefix)/lib/libpixman-1.so.$(VERSION)

include packages/cleanup.mk

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	$(call cmd,stamp)
