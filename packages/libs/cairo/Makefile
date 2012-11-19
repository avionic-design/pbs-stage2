PACKAGE = cairo
VERSION = 1.12.14
LICENSE = LGPL MPL

LOCATION = http://cairographics.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--enable-xcb

prunefiles = \
	$(prefix)/lib/cairo/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/cairo/*.so.* \
	$(prefix)/lib/*.so.*
