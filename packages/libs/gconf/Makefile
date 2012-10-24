PACKAGE = GConf
VERSION = 2.31.91

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-defaults-service

conf-vars += \
	ORBIT_IDL=$(BUILD_TOOLS)/bin/orbit-idl-2

plugin = $(prefix)/lib/$(PACKAGE)/$(MAJOR)
giomod = $(prefix)/lib/gio/modules

prunefiles = \
	$(plugin)/*.la \
	$(giomod)/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/gconf-merge-tree \
	$(prefix)/bin/gconftool-$(MAJOR) \
	$(prefix)/bin/gsettings-data-convert \
	$(prefix)/libexec/gconfd-$(MAJOR) \
	$(prefix)/libexec/gconf-sanity-check-$(MAJOR) \
	$(plugin)/*.so \
	$(giomod)/*.so \
	$(prefix)/lib/*.so.*
