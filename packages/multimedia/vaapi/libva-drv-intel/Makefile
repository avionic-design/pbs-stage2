PACKAGE = libva-intel-driver
VERSION = 1.2.1
LICENSE = MIT & EPL

LOCATION = http://www.freedesktop.org/software/vaapi/releases/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

drivers = $(prefix)/lib/dri

prunefiles = \
	$(drivers)/*.la

stripfiles = \
	$(drivers)/*.so
