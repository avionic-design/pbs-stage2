PACKAGE = libgpio
VERSION = 0.3.2

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libgpio.la

stripfiles = \
	$(prefix)/bin/gpioctl \
	$(prefix)/bin/gpiospy \
	$(prefix)/lib/libgpio.so.0.0.0
