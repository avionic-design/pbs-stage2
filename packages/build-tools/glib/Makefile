include packages/libs/glib/Makefile.location
include packages/build-tools/autotools.mk

conf-args += \
	--disable-systemtap \
	--disable-dtrace \
	--disable-libmount \
	--with-pcre=internal

prunefiles = \
	$(prefix)/lib/gio/modules/libgiofam.la \
	$(prefix)/lib/libgio-2.0.la \
	$(prefix)/lib/libglib-2.0.la \
	$(prefix)/lib/libgmodule-2.0.la \
	$(prefix)/lib/libgobject-2.0.la \
	$(prefix)/lib/libgthread-2.0.la
