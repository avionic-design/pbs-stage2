PACKAGE = mpeg2dec
VERSION = 0.4.1

LOCATION = http://libmpeg2.sourceforge.net/files
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-vars += CFLAGS='-fPIC'

conf-args += \
	--enable-shared \
	--disable-sdl

prunefiles = \
	$(prefix)/lib/libmpeg2.la \
	$(prefix)/lib/libmpeg2convert.la

stripfiles = \
	$(prefix)/bin/corrupt_mpeg2 \
	$(prefix)/bin/extract_mpeg2 \
	$(prefix)/bin/mpeg2dec \
	$(prefix)/lib/libmpeg2.so.0.0.0 \
	$(prefix)/lib/libmpeg2convert.so.0.0.0
