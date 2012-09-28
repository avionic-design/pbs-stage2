PACKAGE = pango
VERSION = 1.32.1
LICENSE = LGPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

plugin = $(prefix)/lib/pango/1.8.0/modules

prunefiles = \
	$(prefix)/lib/*.la \
	$(plugin)/*.la

stripfiles = \
	$(prefix)/bin/pango-querymodules \
	$(prefix)/bin/pango-view \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so
