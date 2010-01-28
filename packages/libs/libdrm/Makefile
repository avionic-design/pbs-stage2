PACKAGE = libdrm
VERSION = 2.4.16

LOCATION = http://dri.freedesktop.org/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libdrm.la

stripfiles = \
	$(prefix)/lib/libdrm_intel.so.1.0.0 \
	$(prefix)/lib/libdrm.so.2.4.0
