PACKAGE = speex
VERSION = 1.2rc1

LOCATION = http://downloads.xiph.org/releases/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--disable-oggtest

sover = 1.5.0

prunefiles = \
	$(prefix)/lib/libspeexdsp.la \
	$(prefix)/lib/libspeex.la

stripfiles = \
	$(prefix)/bin/speexdec \
	$(prefix)/bin/speexenc \
	$(prefix)/lib/libspeexdsp.so.$(sover) \
	$(prefix)/lib/libspeex.so.$(sover)
