PACKAGE = at-spi2-atk
VERSION = 2.6.2
LICENSE = LGPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

$(pkgbuildtree)/m4:
	$(call cmd,mkdir_p)

$(pkgtree)/.autoreconfigure: | $(pkgbuildtree)/m4

prunefiles = \
	$(prefix)/lib/gtk-2.0/modules/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/gtk-2.0/modules/*.so \
	$(prefix)/lib/*.so.*
