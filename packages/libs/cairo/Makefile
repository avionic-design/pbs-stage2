PACKAGE = cairo
VERSION = 1.14.8
LICENSE = LGPL MPL

LOCATION = http://cairographics.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-full-testing \
	--enable-cogl=no

ifeq ($(CONFIG_HAVE_OPENGL),y)
conf-args += --enable-gl=auto
else
ifeq ($(CONFIG_HAVE_OPENGL_ES),y)
conf-args += --enable-glesv2=auto
endif
endif

prunefiles = \
	$(prefix)/lib/cairo/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/cairo/*.so.* \
	$(prefix)/lib/*.so.*
