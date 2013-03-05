PACKAGE = SDL
VERSION = 1.2.15

LOCATION = http://www.libsdl.org/release
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--disable-arts \
	--disable-esd \
	--disable-oss \
	--disable-pulseaudio \
	--disable-rpath \
	--disable-video-directfb \
	--disable-video-fbcon

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
