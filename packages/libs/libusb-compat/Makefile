PACKAGE = libusb-compat
VERSION = 0.1.2

LOCATION = http://prdownloads.sourceforge.net/libusb
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libusb.la

stripfiles = \
	$(prefix)/lib/libusb-0.1.so.4.4.4
