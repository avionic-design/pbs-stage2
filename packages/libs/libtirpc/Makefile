PACKAGE = libtirpc
VERSION = 1.0.8
LICENSE = BSD

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools-reconf.mk

conf-args += \
	--disable-gssapi

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
