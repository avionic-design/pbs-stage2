PACKAGE = cogl
VERSION = 1.16.0

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--disable-nls \
	--disable-glibtest \
	--enable-cairo=no \
	--enable-gtk-doc=no \
	--enable-introspection=no \

ifneq ($(CONFIG_HAVE_OPENGL),y)
conf-args += \
	--enable-gl=no
endif
ifeq ($(CONFIG_HAVE_OPENGL_ES),y)
conf-args += \
	--enable-gles2=yes \
	--enable-cogl-gles2
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
