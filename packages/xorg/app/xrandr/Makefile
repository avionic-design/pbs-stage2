PACKAGE = xrandr
VERSION = 1.4.1
LICENSE = custom

LOCATION = http://xorg.freedesktop.org/releases/individual/app
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/bin/xkeystone

stripfiles = \
	$(prefix)/bin/xrandr
