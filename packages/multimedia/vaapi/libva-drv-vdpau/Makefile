PACKAGE = libva-vdpau-driver
VERSION = 0.7.4
LICENSE = GPLv2+

LOCATION = http://www.freedesktop.org/software/vaapi/releases/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

drivers = $(prefix)/lib/dri

prunefiles = \
	$(drivers)/*.la

stripfiles = \
	$(drivers)/*.so
