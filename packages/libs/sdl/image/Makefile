PACKAGE = SDL_image
VERSION = 1.2.10

LOCATION = http://www.libsdl.org/projects/$(PACKAGE)/release
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libSDL_image.la

stripfiles = \
	$(prefix)/lib/libSDL_image-1.2.so.0.8.2
