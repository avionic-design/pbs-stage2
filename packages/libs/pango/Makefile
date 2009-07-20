PACKAGE = pango
VERSION = 1.24.4

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/1.24
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

DESCRIPTION = Layout and rendering of internationalized text

include packages/autotools.mk

build-args += \
	GLIB_MKENUMS=$(ROOTFS)$(prefix)/bin/glib-mkenums

plugin = $(prefix)/lib/pango/1.6.0/modules

prunefiles = \
	$(prefix)/lib/libpango-1.0.la \
	$(prefix)/lib/libpangocairo-1.0.la \
	$(prefix)/lib/libpangoft2-1.0.la \
	$(prefix)/lib/libpangox-1.0.la \
	$(prefix)/lib/libpangoxft-1.0.la \
	$(plugin)/*.la

sover = 0.2400.4

stripfiles = \
	$(prefix)/bin/pango-querymodules \
	$(prefix)/bin/pango-view \
	$(prefix)/lib/libpangocairo-1.0.so.$(sover) \
	$(prefix)/lib/libpango-1.0.so.$(sover) \
	$(prefix)/lib/libpangoft2-1.0.so.$(sover) \
	$(prefix)/lib/libpangox-1.0.so.$(sover) \
	$(prefix)/lib/libpangoxft-1.0.so.$(sover) \
	$(plugin)/*.so
