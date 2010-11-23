include packages/libs/gdk-pixbuf/Makefile.location
include packages/build-tools/autotools.mk

env += \
	PKG_CONFIG_PATH=$(prefix)/lib/pkgconfig \
	LD_LIBRARY_PATH=$(prefix)/lib

conf-args += \
	--without-libjpeg \
	--without-libtiff \
	--disable-introspection
