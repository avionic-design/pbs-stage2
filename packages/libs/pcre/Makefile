PACKAGE = pcre
VERSION = 8.11

LOCATION = ftp://ftp.csx.cam.ac.uk/pub/software/programming/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--enable-unicode-properties

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/pcregrep \
	$(prefix)/bin/pcretest \
	$(prefix)/lib/*.so.*
