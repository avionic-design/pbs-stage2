PACKAGE = libva-intel-driver
VERSION = 1.6.0
LICENSE = MIT & EPL

LOCATION = http://www.freedesktop.org/software/vaapi/releases/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools-reconf.mk

conf-args += \
	--disable-wayland

drivers = $(prefix)/lib/dri

prunefiles = \
	$(drivers)/*.la

stripfiles = \
	$(drivers)/*.so
