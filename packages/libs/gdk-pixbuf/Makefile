include packages/libs/gdk-pixbuf/Makefile.location
include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--without-libjasper \
	--without-libtiff

conf-vars += \
	gio_can_sniff=yes

plugin = $(prefix)/lib/gdk-pixbuf-2.0/2.10.0

prunefiles = \
	$(plugin)/loaders/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/gdk-pixbuf-csource \
	$(prefix)/bin/gdk-pixbuf-query-loaders \
	$(plugin)/loaders/*.so \
	$(prefix)/lib/*.so.*
