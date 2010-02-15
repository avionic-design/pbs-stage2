PACKAGE = libusb
VERSION = 1.0.2

LOCATION = http://prdownloads.sourceforge.net/libusb
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libusb-1.0.la

stripfiles = \
	$(prefix)/lib/libusb-1.0.so.0.0.0
