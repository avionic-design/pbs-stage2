PACKAGE = gdk-pixbuf
VERSION = 2.21.6

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.21
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/build-tools/autotools.mk

env += \
	PKG_CONFIG_PATH=$(prefix)/lib/pkgconfig \
	LD_LIBRARY_PATH=$(prefix)/lib

conf-args += \
	--without-libjpeg \
	--without-libtiff
