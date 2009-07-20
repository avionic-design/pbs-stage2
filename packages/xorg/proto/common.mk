LOCATION ?= http://xorg.freedesktop.org/releases/individual/proto
TARBALLS ?= $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk
