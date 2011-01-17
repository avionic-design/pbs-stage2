PACKAGE = speex
VERSION = 1.2rc1

LOCATION = http://downloads.xiph.org/releases/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--disable-oggtest \
	--with-ogg=$(SYSROOT)$(prefix)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/speexdec \
	$(prefix)/bin/speexenc \
	$(prefix)/lib/*.so.*
