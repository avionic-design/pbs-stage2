include packages/libs/glib/Makefile.location
include packages/autotools-reconf.mk

conf-vars += \
	glib_cv_stack_grows=no \
	glib_cv_monotonic_clock=yes \
	glib_cv_uscore=no \
	glib_cv_have_qsort_r=yes \
	ac_cv_func_posix_getpwuid_r=yes \
	ac_cv_func_posix_getgrgid_r=yes \
	ac_cv_alignof_guint32=4 \
	ac_cv_alignof_guint64=8

ifeq ($(ARCH),x86_64)
  conf-vars += ac_cv_alignof_unsigned_long=8
else
  conf-vars += ac_cv_alignof_unsigned_long=4
endif

# The configure get confused by uclibc, force using the external libiconv
ifeq ($(CONFIG_UCLIBC),y)
  conf-args += --with-libiconv=gnu
else
# Use the external libiconv when it is enabled
ifeq ($(CONFIG_PACKAGE_LIBS_ICONV),y)
  conf-args += --with-libiconv=gnu
endif
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/gdbus \
	$(prefix)/bin/gio-querymodules \
	$(prefix)/bin/glib-compile-resources \
	$(prefix)/bin/glib-compile-schemas \
	$(prefix)/bin/glib-genmarshal \
	$(prefix)/bin/gobject-query \
	$(prefix)/bin/gresource \
	$(prefix)/bin/gsettings \
	$(prefix)/bin/gtester \
	$(prefix)/lib/*.so.*
