PACKAGE = libxdg-basedir
VERSION = 1.2.0

LOCATION = https://github.com/devnev/$(PACKAGE)/archive
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(PACKAGE)-$(VERSION)

include packages/autotools.mk

conf-args += --with-sysroot=$(SYSROOT)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
