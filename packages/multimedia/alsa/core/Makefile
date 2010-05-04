PACKAGE = alsa-lib
VERSION = 1.0.23

LOCATION = ftp://ftp.alsa-project.org/pub/lib
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-old-symbols \
	--disable-alisp \
	--disable-python

ifeq ($(FLOAT),soft)
conf-args += \
	--with-softfloat
endif

plugin = $(prefix)/lib/alsa-lib
sover = 2.0.0

prunefiles = \
	$(prefix)/lib/libasound.la \
	$(plugin)/smixer/*.la

stripfiles = \
	$(prefix)/bin/aserver \
	$(prefix)/lib/libasound.so.$(sover) \
	$(plugin)/smixer/*.so
