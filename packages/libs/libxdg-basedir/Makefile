PACKAGE = libxdg-basedir
VERSION = 1.2.0

LOCATION = http://nevill.ch/libxdg-basedir/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += --with-sysroot=$(SYSROOT)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
