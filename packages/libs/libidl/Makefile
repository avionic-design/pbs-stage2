PACKAGE = libIDL
VERSION = 0.8.14

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/0.8
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-vars += \
	libIDL_cv_long_long_format=ll

prunefiles = \
	$(prefix)/lib/libIDL-2.la

stripfiles = \
	$(prefix)/lib/libIDL-2.so.0.0.0
