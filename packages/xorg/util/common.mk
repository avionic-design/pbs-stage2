LOCATION ?= http://xorg.freedesktop.org/releases/individual/util
TARBALLS ?= $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk
