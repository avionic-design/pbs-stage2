PACKAGE = libsamplerate
VERSION = 0.1.8
LICENSE = GPL

LOCATION = http://mega-nerd.com/SRC
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--disable-sndfile

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/sndfile-resample \
	$(prefix)/lib/*.so.*
