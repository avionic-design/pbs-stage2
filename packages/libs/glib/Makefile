PACKAGE = glib
VERSION = 2.25.10

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.25
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-vars += \
	glib_cv_stack_grows=no \
	glib_cv_monotonic_clock=yes \
	glib_cv_uscore=no \
	ac_cv_func_posix_getpwuid_r=yes \
	ac_cv_func_posix_getgrgid_r=yes

prunefiles = \
	$(prefix)/lib/libgio-2.0.la \
	$(prefix)/lib/libglib-2.0.la \
	$(prefix)/lib/libgmodule-2.0.la \
	$(prefix)/lib/libgobject-2.0.la \
	$(prefix)/lib/libgthread-2.0.la

sover = 0.2510.0

stripfiles = \
	$(prefix)/bin/gdbus \
	$(prefix)/bin/gio-querymodules \
	$(prefix)/bin/glib-compile-schemas \
	$(prefix)/bin/glib-genmarshal \
	$(prefix)/bin/gobject-query \
	$(prefix)/bin/gsettings \
	$(prefix)/bin/gtester \
	$(prefix)/lib/libgthread-2.0.so.$(sover) \
	$(prefix)/lib/libgmodule-2.0.so.$(sover) \
	$(prefix)/lib/libgobject-2.0.so.$(sover) \
	$(prefix)/lib/libgio-2.0.so.$(sover) \
	$(prefix)/lib/libglib-2.0.so.$(sover)
