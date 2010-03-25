PACKAGE = atk
VERSION = 1.29.92

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/1.29
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-glibtest

prunefiles = \
	$(prefix)/lib/libatk-1.0.la

stripfiles = \
	$(prefix)/lib/libatk-1.0.so.0.3001.1
