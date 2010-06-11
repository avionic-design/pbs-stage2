PACKAGE = libjpeg
VERSION = 8b

LOCATION = http://www.ijg.org/files
TARBALLS = jpegsrc.v$(VERSION).tar.gz

include packages/autotools.mk

pkgbuildtree := $(pkgtree)/jpeg-$(VERSION)

prunefiles = \
	$(prefix)/lib/libjpeg.la

stripfiles = \
	$(prefix)/bin/cjpeg \
	$(prefix)/bin/djpeg \
	$(prefix)/bin/jpegtran \
	$(prefix)/bin/rdjpgcom \
	$(prefix)/bin/wrjpgcom \
	$(prefix)/lib/libjpeg.so.8.0.2
