PACKAGE = glibmm
VERSION = 2.25.2

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/glibmm/2.25
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libgiomm-2.4.la \
	$(prefix)/lib/libglibmm-2.4.la \
	$(prefix)/lib/libglibmm_generate_extra_defs-2.4.la

sover = 1.3.0

stripfiles = \
	$(prefix)/lib/libgiomm-2.4.so.$(sover) \
	$(prefix)/lib/libglibmm-2.4.so.$(sover) \
	$(prefix)/lib/libglibmm_generate_extra_defs-2.4.so.$(sover)
