PACKAGE = libusb-compat
VERSION = 0.1.2

LOCATION = http://prdownloads.sourceforge.net/libusb
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

conf-vars = \
	CXXFLAGS='$(CXXFLAGS)' \
	CPPFLAGS='$(CPPFLAGS)' \
	LDFLAGS='$(LDFLAGS)' \
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

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(ROOTFS)

$(pkgtree)/.do-install: $(pkgtree)/.binary
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

prunefiles = \
	$(prefix)/lib/libusb.la

stripfiles = \
	$(prefix)/lib/libusb-0.1.so.4.4.4

include packages/cleanup.mk

$(pkgtree)/.install: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	$(call cmd,stamp)
