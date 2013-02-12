PACKAGE = cogl
VERSION = 1.12.2

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--disable-nls \
	--enable-gtk-doc=no

ifeq ($(CONFIG_HAVE_OPENGL_ES),y)
conf-args += \
	--enable-gles1=no \
	--enable-gles2=yes \
	--enable-gl=no
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
