include packages/libs/libpng/Makefile.location
include packages/build-tools/autotools.mk

CPPFLAGS = -I$(prefix)/include
LDFLAGS = -L$(prefix)/lib

conf-vars += \
	CPPFLAGS='$(CPPFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

prunefiles = \
	$(prefix)/lib/libpng*.la
