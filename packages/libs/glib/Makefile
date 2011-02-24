include packages/libs/glib/Makefile.location
include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

conf-vars += \
	glib_cv_stack_grows=no \
	glib_cv_monotonic_clock=yes \
	glib_cv_uscore=no \
	ac_cv_func_posix_getpwuid_r=yes \
	ac_cv_func_posix_getgrgid_r=yes

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/gdbus \
	$(prefix)/bin/gio-querymodules \
	$(prefix)/bin/glib-compile-schemas \
	$(prefix)/bin/glib-genmarshal \
	$(prefix)/bin/gobject-query \
	$(prefix)/bin/gsettings \
	$(prefix)/bin/gtester \
	$(prefix)/lib/*.so.*
