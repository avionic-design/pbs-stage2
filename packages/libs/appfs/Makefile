PACKAGE = appfs
VERSION = 0.1.0

LOCATION = http://ftp.avionic-design.de/pub/appfs/
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--disable-shared

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
