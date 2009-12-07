LOCATION ?= http://xorg.freedesktop.org/releases/individual/driver
TARBALLS ?= $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk
