PACKAGE = libgudev
VERSION = 231
LICENSE = LGPL

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--enable-static \
	--disable-umockdev

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
