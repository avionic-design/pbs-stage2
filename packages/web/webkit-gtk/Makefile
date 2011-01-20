PACKAGE = webkit
VERSION = 1.3.10

LOCATION = http://www.webkitgtk.org
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-unicode-backend=glib \
	--disable-video

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/jsc-1 \
	$(prefix)/lib/*.so.*
