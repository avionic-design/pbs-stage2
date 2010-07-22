PACKAGE = glib
VERSION = 2.25.11

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.25
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-vars += \
	glib_cv_stack_grows=no \
	glib_cv_monotonic_clock=yes \
	glib_cv_uscore=no \
	ac_cv_func_posix_getpwuid_r=yes \
	ac_cv_func_posix_getgrgid_r=yes

stripfiles = \
	$(prefix)/bin/gdbus \
	$(prefix)/bin/gio-querymodules \
	$(prefix)/bin/glib-compile-schemas \
	$(prefix)/bin/glib-genmarshal \
	$(prefix)/bin/gobject-query \
	$(prefix)/bin/gsettings \
	$(prefix)/bin/gtester \
	$(prefix)/lib/*.so.*
