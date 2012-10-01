PACKAGE = libgpio
VERSION = 0.4.0
LICENSE = GPL

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/gpioctl \
	$(prefix)/lib/*.so.*
