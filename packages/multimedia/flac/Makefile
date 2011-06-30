PACKAGE = flac
VERSION = 1.2.1

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-doxygen-docs \
	--disable-ogg

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/flac \
	$(prefix)/bin/metaflac \
	$(prefix)/lib/*.so.*
