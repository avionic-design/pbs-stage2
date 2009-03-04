PACKAGE = xorg-server
VERSION = 1.6.0

LOCATION = http://xorg.freedesktop.org/releases/individual/xserver
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc \
	--disable-kdrive \
	--disable-xfbdev \
	--disable-xinerama \
	--disable-xprint \
	--disable-dpms \
	--disable-xv \
	--disable-xgl \
	--disable-glx \
	--disable-dri \
	--disable-dri2 \
	--disable-dga \
	--enable-xv \
	--enable-xorg

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
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

PHONY += package-do-install
package-do-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

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

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

