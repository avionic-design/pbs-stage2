PACKAGE = libogg
VERSION = 1.3.0
LICENSE = BSD

LOCATION = http://downloads.xiph.org/releases/ogg
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
