PACKAGE = gtk-engines
ifeq ($(CONFIG_VIRTUAL_LIBS_GTK_GTK3),y)
VERSION = 2.91.1
else
VERSION = 2.20.2
endif

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

engine = $(prefix)/lib/gtk-2.0/2.10.0/engines

prunefiles = \
	$(engine)/*.la

stripfiles = \
	$(engine)/*.so
