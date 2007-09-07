PACKAGE = pango
VERSION = 1.17.4

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/pango/1.17
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/autotools.mk

#env += \
#	PKG_CONFIG_PATH=$(ROOTFS)/usr/lib/pkgconfig \
#	PKG_CONFIG_LIBDIR=$(ROOTFS)/usr/lib/pkgconfig \
#	sysroot=$(ROOTFS)

conf-args += \
	--without-x

conf-vars += \
	PKG_CONFIG_PATH=$(ROOTFS)/usr/lib/pkgconfig \
	PKG_CONFIG_LIBDIR=$(ROOTFS)/usr/lib/pkgconfig \
	PKG_CONFIG="$(CURDIR)/support/pkg-config --sysroot $(ROOTFS)"

build-vars += \
	PKG_CONFIG_PATH=$(ROOTFS)/usr/lib/pkgconfig \
	PKG_CONFIG_LIBDIR=$(ROOTFS)/usr/lib/pkgconfig

install-vars += \
	PKG_CONFIG_PATH=$(ROOTFS)/usr/lib/pkgconfig \
	PKG_CONFIG_LIBDIR=$(ROOTFS)/usr/lib/pkgconfig

package-pre-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh

package-clean:
	@:

