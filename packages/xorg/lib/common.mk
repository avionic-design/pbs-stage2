LOCATION ?= http://xorg.freedesktop.org/releases/individual/lib
TARBALLS ?= $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk
