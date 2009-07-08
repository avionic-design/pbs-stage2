PACKAGE = xorg-server
VERSION = 1.6.1.902

LOCATION = http://xorg.freedesktop.org/releases/individual/xserver
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

##############################################################################

include packages/common.mk

ARCH := $(shell echo $(CONFIG_ARCH))

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--localstatedir=/var \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-args += \
	--with-xkb-output=/var/lib/xkb \
	--disable-null-root-cursor \
	--disable-config-dbus \
	--enable-config-hal \
	--disable-kdrive \
	--disable-xfbdev \
	--disable-xinerama \
	--disable-xvfb \
	--disable-xv \
	--disable-glx \
	--disable-dri \
	--disable-dri2 \
	--disable-dga \
	--enable-dpms \
	--enable-xv \
	--enable-xorg

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

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
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

module = $(prefix)/lib/xorg/modules

prunefiles = \
	$(module)/*.la \
	$(module)/extensions/*.la \
	$(module)/linux/*.la \
	$(module)/multimedia/*.la

stripfiles = \
	$(prefix)/bin/cvt \
	$(prefix)/bin/gtf \
	$(prefix)/bin/Xnest \
	$(prefix)/bin/Xorg \
	$(prefix)/bin/Xvfb \
	$(module)/*.so \
	$(module)/extensions/*.so \
	$(module)/linux/*.so \
	$(module)/multimedia/*.so

include packages/cleanup.mk

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -s $(DESTDIR)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -v $(VERSION)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -v $(VERSION) -r $(ROOTFS)
	$(call cmd,stamp)
