PACKAGE = atk
VERSION = 1.25.2

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/1.25
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = The ATK accessibility toolkit

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
	--sysconfdir=/etc

conf-vars = \
	CC='$(CC) --sysroot $(ROOTFS)' \
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

package-do-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

sover = 0.2511.1

prunefiles = \
	$(prefix)/lib/libatk-1.0.la

stripfiles = \
	$(prefix)/lib/libatk-1.0.so.$(sover)

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

