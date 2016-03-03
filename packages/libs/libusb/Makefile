PACKAGE = libusb
VERSION = 1.0.20
LICENSE = LGPL

LOCATION = http://prdownloads.sourceforge.net/libusb
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

# 1.0.20 has broken parallel build
NUM_CPU = 1

include packages/autotools.mk

conf-args += \
	--disable-udev

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
