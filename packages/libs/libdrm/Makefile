PACKAGE = libdrm
VERSION = 2.4.16

LOCATION = http://dri.freedesktop.org/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libdrm.la

stripfiles = \
	$(prefix)/lib/libdrm.so.$(VERSION)
