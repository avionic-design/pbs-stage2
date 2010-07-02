PACKAGE = GConf
VERSION = 2.31.5

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.31
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-defaults-service

plugin = $(prefix)/lib/$(PACKAGE)/2
giomod = $(prefix)/lib/gio/modules

prunefiles = \
	$(plugin)/*.la \
	$(giomod)/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/gconf-merge-tree \
	$(prefix)/bin/gconftool-2 \
	$(prefix)/bin/gsettings-data-convert \
	$(prefix)/libexec/gconfd-2 \
	$(prefix)/libexec/gconf-sanity-check-2 \
	$(plugin)/*.so \
	$(giomod)/*.so \
	$(prefix)/lib/*.so.*
