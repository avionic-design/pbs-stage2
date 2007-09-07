PACKAGE = atk
VERSION = 1.19.3

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/atk/1.19
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/autotools.mk

#env += \
#	PKG_CONFIG_PATH=$(ROOTFS)/usr/lib/pkgconfig \
#	sysroot=$(ROOTFS)

conf-vars += \
	PKG_CONFIG_PATH=$(ROOTFS)/usr/lib/pkgconfig

package-pre-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh

package-clean:
	@:

