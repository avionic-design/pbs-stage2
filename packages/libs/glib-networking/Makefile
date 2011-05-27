PACKAGE = glib-networking
VERSION = 2.28.7

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-static

plugin = $(prefix)/lib/gio/modules

prunefiles = \
	$(plugin)/*.la

stripfiles = \
	$(plugin)/*.so
