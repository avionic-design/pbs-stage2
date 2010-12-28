PACKAGE = dconf
VERSION = 0.5.1

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--libexecdir=$(prefix)/lib/dconf

prunefiles = \
	$(prefix)/lib/*.la

plugin = $(prefix)/lib/gio/modules

stripfiles = \
	$(prefix)/bin/dconf \
	$(prefix)/bin/dconf-editor \
	$(prefix)/lib/*.so.* \
	$(prefix)/lib/dconf/dconf-service \
	$(plugin)/*.so
