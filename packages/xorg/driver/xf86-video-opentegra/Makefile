PACKAGE = xf86-video-opentegra
VERSION = 0.6.0
LICENSE = custom

LOCATION = http://people.freedesktop.org/~tagr
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/xorg/modules/drivers/*.la

stripfiles = \
	$(prefix)/lib/xorg/modules/drivers/*.so
