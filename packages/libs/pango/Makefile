PACKAGE = pango
VERSION = 1.26.2

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/1.26
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

# pange configure does not detect the C++ cross-compiler correctly
conf-vars += \
	CXX=$(TARGET)-g++

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

sover = 0.2600.2

stripfiles = \
	$(prefix)/bin/pango-querymodules \
	$(prefix)/bin/pango-view \
	$(prefix)/lib/libpangocairo-1.0.so.$(sover) \
	$(prefix)/lib/libpango-1.0.so.$(sover) \
	$(prefix)/lib/libpangoft2-1.0.so.$(sover) \
	$(prefix)/lib/libpangox-1.0.so.$(sover) \
	$(prefix)/lib/libpangoxft-1.0.so.$(sover) \
	$(plugin)/*.so
