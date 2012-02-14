PACKAGE = libdrm
VERSION = 2.4.31

LOCATION = http://dri.freedesktop.org/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools-reconf.mk

conf-args += \
	--enable-nouveau-experimental-api \
	--with-sysroot=$(SYSROOT)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
