PACKAGE = neon
VERSION = 0.29.6

LOCATION = http://www.webdav.org/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-static \
	--enable-shared

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
