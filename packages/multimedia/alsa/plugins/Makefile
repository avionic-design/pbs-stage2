PACKAGE = alsa-plugins
VERSION = 1.0.26
LICENSE = LGPL

LOCATION = ftp://ftp.alsa-project.org/pub/plugins
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-static \
	--disable-avcodec \
	--disable-jack

plugins = $(prefix)/lib/alsa-lib

prunefiles = \
	$(plugins)/lib/*.la

stripfiles = \
	$(plugins)/lib/*.so.*
