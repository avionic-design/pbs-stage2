PACKAGE = openbox
VERSION = 3.5.2
LICENSE = GPL

LOCATION = http://openbox.org/dist/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--disable-nls \
	--disable-rpath

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/openbox \
	$(prefix)/bin/obxprop \
	$(prefix)/lib/*.so.*
