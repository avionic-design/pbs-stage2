LOCATION ?= http://xorg.freedesktop.org/releases/individual/data
TARBALLS ?= $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk
