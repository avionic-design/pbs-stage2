PACKAGE = libjpeg
VERSION = 9b

LOCATION = http://www.ijg.org/files
TARBALLS = jpegsrc.v$(VERSION).tar.gz

include packages/autotools.mk

pkgbuildtree := $(pkgtree)/jpeg-$(VERSION)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/cjpeg \
	$(prefix)/bin/djpeg \
	$(prefix)/bin/jpegtran \
	$(prefix)/bin/rdjpgcom \
	$(prefix)/bin/wrjpgcom \
	$(prefix)/lib/libjpeg.so.*
