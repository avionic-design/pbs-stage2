include packages/libs/gdk-pixbuf/Makefile.location
include packages/build-tools/autotools.mk

env += \
	PKG_CONFIG_PATH=$(prefix)/lib/pkgconfig \
	LD_LIBRARY_PATH=$(prefix)/lib

conf-args += \
	--without-libjpeg \
	--without-libtiff \
	--disable-introspection

prunefiles = \
	$(prefix)/lib/gdk-pixbuf-2.0/2.10.0/loaders/*.la \
	$(prefix)/lib/libgdk_pixbuf-2.0.la
