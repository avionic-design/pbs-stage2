PACKAGE = alsa-lib
VERSION = 1.0.25

LOCATION = ftp://ftp.alsa-project.org/pub/lib
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-old-symbols \
	--disable-alisp \
	--disable-python \
	--with-versioned=no

ifeq ($(FLOAT),soft)
conf-args += \
	--with-softfloat
endif

plugin = $(prefix)/lib/alsa-lib

prunefiles = \
	$(prefix)/lib/*.la \
	$(plugin)/smixer/*.la

stripfiles = \
	$(prefix)/bin/aserver \
	$(prefix)/lib/*.so.* \
	$(plugin)/smixer/*.so
