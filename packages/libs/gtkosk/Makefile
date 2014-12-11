PACKAGE = gtkosk
VERSION = 0.3.8
LICENSE = GPL

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

ifeq ($(CONFIG_VIRTUAL_LIBS_GTK_GTK3),y)
  conf-args += --with-gtk=3.0
else
  conf-args += --with-gtk=2.0
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/gtkosk \
	$(prefix)/lib/*.so.*

$(pkgtree)/.gtkdocize:
	cd $(pkgbuildtree) && \
		$(env) gtkdocize
	$(call cmd,stamp)

$(pkgtree)/.autoreconfigure: $(pkgtree)/.gtkdocize
