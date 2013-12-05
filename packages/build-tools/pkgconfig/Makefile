PACKAGE = pkg-config
VERSION = 0.28
LICENSE = GPL

LOCATION = http://pkgconfig.freedesktop.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/build-tools/autotools.mk

conf-args += \
	--with-internal-glib
