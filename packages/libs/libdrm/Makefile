PACKAGE = libdrm
VERSION = 2.4.21

LOCATION = http://dri.freedesktop.org/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libdrm_intel.la \
	$(prefix)/lib/libdrm_radeon.la \
	$(prefix)/lib/libdrm.la \
	$(prefix)/lib/libkms.la

stripfiles = \
	$(prefix)/lib/libdrm_intel.so.1.0.0 \
	$(prefix)/lib/libdrm_radeon.so.1.0.0 \
	$(prefix)/lib/libdrm.so.2.4.0 \
	$(prefix)/lib/libkms.so.1.0.0
