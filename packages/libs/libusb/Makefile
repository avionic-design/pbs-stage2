PACKAGE = libusb
VERSION = 1.0.9

LOCATION = http://prdownloads.sourceforge.net/libusb
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
