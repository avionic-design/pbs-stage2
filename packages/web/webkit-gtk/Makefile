PACKAGE = webkit
VERSION = 1.6.1

LOCATION = http://www.webkitgtk.org
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

ACLOCAL_FLAGS += -I Source/autotools

conf-args += \
	--with-unicode-backend=glib \
	--disable-spellcheck \
	--with-gtk=2.0

ifneq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_VIDEO),y)
conf-args += --disable-video
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/* \
	$(prefix)/lib/*.so.*
