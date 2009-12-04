LOCATION ?= http://xorg.freedesktop.org/releases/individual/app
TARBALLS ?= $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk
