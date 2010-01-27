PACKAGE = SDL
VERSION = 1.2.14

LOCATION = http://www.libsdl.org/release
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--disable-arts \
	--disable-esd \
	--disable-oss \
	--disable-pulseaudio \
	--disable-rpath \
	--disable-video-directfb

prunefiles = \
	$(prefix)/lib/libSDL.la

stripfiles = \
	$(prefix)/lib/libSDL-1.2.so.0.11.3
