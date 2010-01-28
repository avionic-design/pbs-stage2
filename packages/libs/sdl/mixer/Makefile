PACKAGE = SDL_mixer
VERSION = 1.2.11

LOCATION = http://www.libsdl.org/projects/$(PACKAGE)/release
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk
NUM_CPU = 1

prunefiles = \
	$(prefix)/lib/libSDL_mixer.la

stripfiles = \
	$(prefix)/lib/libSDL_mixer-1.2.so.0.10.1
