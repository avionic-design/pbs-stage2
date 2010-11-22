PACKAGE = tango-icon-theme
VERSION = 0.8.90

LOCATION = http://tango.freedesktop.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

env += \
	PKG_CONFIG_LIBDIR=$(objtree)/build-tools/share/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=

conf-args += \
	--disable-icon-framing
