PACKAGE = libdrm
VERSION = 2.4.80
LICENSE = custom

LOCATION = http://dri.freedesktop.org/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-nouveau \
	--disable-vmwgfx \
	--disable-manpages \
	--disable-radeon \
	--disable-valgrind

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
